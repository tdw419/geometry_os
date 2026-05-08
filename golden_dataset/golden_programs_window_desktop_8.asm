; DESCRIPTION: Draw object: pos=the screen, color=green, size=fixed size.

; window_desktop.asm -- Multi-window desktop demo (Phase 68b)
; Demonstrates WINSYS + MOUSEQ integration: drag, focus, multiple windows.
; Each window draws its own content into its offscreen buffer.
;
; Controls: Move mouse to interact. Click title bar to drag, click body to focus.
; Press Q to quit.

; ── Constants ──
LDI r9, 1
LDI r20, 0         ; zero constant

; ── Store title strings in RAM ──
LDI r4, 0x2000
STRO r4, "Hello"
LDI r4, 0x2020
STRO r4, "Counter"
LDI r4, 0x2040
STRO r4, "Colors"

; ── Create 3 windows ──

; Window 1: "Hello" at (20, 20), 100x80
LDI r14, 20
LDI r6, 20
LDI r1, 100
LDI r13, 80
LDI r7, 0x2000     ; title addr
LDI r4, 0          ; op=0 (create)
WINSYS r4
MOV r2, r3        ; r2 = win1_id

; Window 2: "Counter" at (140, 30), 100x80
LDI r14, 140
LDI r6, 30
LDI r1, 100
LDI r13, 80
LDI r7, 0x2020
LDI r4, 0
WINSYS r4
MOV r10, r3        ; r10 = win2_id

; Window 3: "Colors" at (60, 120), 100x80
LDI r14, 60
LDI r6, 120
LDI r1, 100
LDI r13, 80
LDI r7, 0x2040
LDI r4, 0
WINSYS r4
MOV r12, r3        ; r12 = win3_id

; ── Draw window contents ──

; Window 1: Green background with welcome text
CALL draw_win1

; Window 2: Blue background with counter
CALL draw_win2

; Window 3: Color stripes
CALL draw_win3

; ── Drag state ──
; r0 = dragging window id (0 = none)
; r16 = drag offset X
; r17 = drag offset Y
LDI r0, 0
LDI r16, 0
LDI r17, 0

; ── Counter for window 2 ──
LDI r18, 0         ; counter value

; ── Main loop ──
main_loop:
  FILL r20          ; clear screen to black

  ; Read mouse state: r21=mx, r22=my, r23=btn
  MOUSEQ r21

  ; Read keyboard
  IKEY r24
  LDI r25, 81       ; 'Q'
  CMP r24, r25
  JZ r3, quit

  ; ── Handle mouse button ──
  LDI r25, 2
  CMP r23, r25      ; click?
  BGE r3, check_drag

  ; Fresh click -- do hittest
  LDI r4, 4         ; op=4 (hittest)
  WINSYS r4         ; r3=win_id, r14=hit_type

  ; If no hit, skip
  JZ r3, no_click_action

  ; Bring clicked window to front
  LDI r4, 2         ; op=2 (bring to front)
  WINSYS r4

  ; Check hit type -- title bar = start drag
  LDI r25, 1
  CMP r14, r25       ; r14 = hit_type from hittest
  JNZ r3, no_click_action

  ; Start dragging (title bar hit)
  MOV r0, r3       ; r0 = dragging win_id

  ; Get window info for drag offset
  MOV r3, r0
  LDI r14, 0x9000    ; winfo dest addr
  LDI r4, 6         ; op=6 (winfo)
  WINSYS r4

  ; drag_ox = mouse_x - win_x
  LOAD r25, 0x9000  ; win_x
  MOV r26, r21
  SUB r26, r25      ; mx - win_x
  MOV r16, r26

  ; drag_oy = mouse_y - win_y
  LOAD r25, 0x9001  ; win_y
  MOV r26, r22
  SUB r26, r25      ; my - win_y
  MOV r17, r26

  JMP no_click_action

check_drag:
  ; If not dragging, skip
  JZ r0, no_click_action

  ; If button released (btn=0), stop dragging
  JZ r23, stop_drag

  ; Still dragging -- move window to mouse position
  MOV r3, r0       ; win_id
  MOV r14, r21
  SUB r14, r16       ; new_x = mx - drag_ox
  MOV r6, r22
  SUB r6, r17       ; new_y = my - drag_oy
  LDI r4, 5         ; op=5 (moveto)
  WINSYS r4

  JMP no_click_action

stop_drag:
  LDI r0, 0        ; stop dragging
  JMP no_click_action

no_click_action:

  ; ── Update counter (throttled to ~2/sec) ──
  LDI r25, 0xFFE
  LOAD r26, r25     ; TICKS
  LDI r27, 31
  AND r26, r27      ; TICKS & 31
  JNZ r26, skip_counter
  ADD r18, r9       ; counter++
  CALL draw_win2    ; redraw with new counter
skip_counter:

  ; ── Animate colors window (~4/sec) ──
  LDI r25, 0xFFE
  LOAD r26, r25
  LDI r27, 15
  AND r26, r27
  JNZ r26, skip_colors
  CALL draw_win3
skip_colors:

  ; ── Draw window borders and title bars on screen ──
  ; Window 1 border
  MOV r3, r2
  CALL draw_window_frame

  ; Window 2 border
  MOV r3, r10
  CALL draw_window_frame

  ; Window 3 border
  MOV r3, r12
  CALL draw_window_frame

  FRAME
  JMP main_loop

quit:
  HALT

; ── Draw Window 1: Green background ──
draw_win1:
  PUSH r31
  PUSH r3
  MOV r3, r2       ; win_id

  ; Fill with dark green
  LDI r1, 0x003300  ; dark green
  LDI r13, 0         ; y
fill1_loop:
  LDI r4, 0         ; x
fill1_x:
  WPIXEL r3, r4, r13, r1
  ADD r4, r9        ; x++
  LDI r25, 100
  CMP r4, r25
  BLT r3, fill1_x
  ADD r13, r9        ; y++
  LDI r25, 80
  CMP r13, r25
  BLT r3, fill1_loop

  ; Draw a bright green H in the center
  LDI r1, 0x00FF00  ; bright green
  ; Left vertical of H
  LDI r13, 30
  LDI r4, 40
h_left:
  WPIXEL r3, r4, r13, r1
  WPIXEL r3, r4, r13, r1
  ADD r13, r9
  LDI r25, 60
  CMP r13, r25
  BLT r3, h_left

  ; Right vertical of H
  LDI r13, 30
  LDI r4, 48
h_right:
  WPIXEL r3, r4, r13, r1
  ADD r13, r9
  LDI r25, 60
  CMP r13, r25
  BLT r3, h_right

  ; Crossbar of H
  LDI r13, 44
  LDI r4, 40
h_bar:
  WPIXEL r3, r4, r13, r1
  ADD r4, r9
  LDI r25, 49
  CMP r4, r25
  BLT r3, h_bar

  POP r3
  POP r31
  RET

; ── Draw Window 2: Blue background with counter bar ──
draw_win2:
  PUSH r31
  PUSH r3

  MOV r3, r10       ; win_id

  ; Fill with dark blue
  LDI r1, 0x000033  ; dark blue
  LDI r13, 0
fill2_loop:
  LDI r4, 0
fill2_x:
  WPIXEL r3, r4, r13, r1
  ADD r4, r9
  LDI r25, 100
  CMP r4, r25
  BLT r3, fill2_x
  ADD r13, r9
  LDI r25, 80
  CMP r13, r25
  BLT r3, fill2_loop

  ; Draw counter bar (white bar, length = counter % 90 + 5)
  LDI r1, 0xFFFFFF  ; white
  LDI r13, 40        ; y position
  MOV r7, r18
  LDI r25, 90
  MOD r7, r25
  ADD r7, r9        ; +1 = at least 1 pixel
  LDI r4, 5         ; x offset
bar_loop:
  CMP r4, r7
  BGE r3, bar_done
  WPIXEL r3, r4, r13, r1
  ADD r4, r9
  JMP bar_loop
bar_done:

  POP r3
  POP r31
  RET

; ── Draw Window 3: Animated color stripes ──
draw_win3:
  PUSH r31
  PUSH r3
  PUSH r14
  PUSH r6

  MOV r3, r12       ; win_id

  ; Get ticks for animation
  LDI r25, 0xFFE
  LOAD r26, r25     ; ticks

  ; Fill with animated stripes
  LDI r13, 0         ; y
stripe_y:
  LDI r4, 0         ; x
stripe_x:
  ; Color from position + time
  MOV r14, r4
  ADD r14, r26       ; x + ticks
  LDI r25, 31
  AND r14, r25       ; (x + ticks) & 31
  LDI r25, 3
  MUL r14, r25       ; 0-93
  LDI r25, 8
  SHL r14, r25       ; shift into green channel
  MOV r1, r13
  LDI r6, 7
  AND r1, r6        ; y & 7
  LDI r25, 16
  SHL r1, r25       ; red channel
  OR r14, r1         ; combine
  MOV r1, r14

  WPIXEL r3, r4, r13, r1
  ADD r4, r9        ; x++
  LDI r25, 100
  CMP r4, r25
  BLT r3, stripe_x

  ADD r13, r9        ; y++
  LDI r25, 80
  CMP r13, r25
  BLT r3, stripe_y

  POP r6
  POP r14
  POP r3
  POP r31
  RET

; ── Draw window frame (title bar + border) on screen ──
; r3 = win_id
draw_window_frame:
  PUSH r31
  PUSH r3
  PUSH r14
  PUSH r6
  PUSH r1
  PUSH r13
  PUSH r7
  PUSH r4

  ; Get window info
  MOV r3, r3
  LDI r14, 0x9200    ; winfo addr
  LDI r4, 6         ; WINFO
  WINSYS r4
  JZ r3, frame_done  ; window not found

  LOAD r6, 0x9200   ; win_x
  LOAD r1, 0x9201   ; win_y
  LOAD r13, 0x9202   ; win_w
  LOAD r7, 0x9203   ; win_h

  ; Title bar (12px tall, purple)
  LDI r14, 0x444488
  MOV r4, r1         ; y = win_y
title_y:
  MOV r3, r6         ; x = win_x
title_x:
  PSET r3, r4, r14
  ADD r3, r9
  MOV r25, r6
  ADD r25, r13        ; x limit
  CMP r3, r25
  BLT r3, title_x
  ADD r4, r9
  LDI r25, 12
  ADD r25, r1        ; y limit (win_y + 12)
  CMP r4, r25
  BLT r3, title_y

  ; Border outline (gray)
  LDI r14, 0x888888
  ; Left + right edges
  MOV r3, r1         ; y = win_y
border_y:
  PSET r6, r3, r14    ; left edge
  MOV r25, r6
  ADD r25, r13
  SUB r25, r9        ; right edge x
  PSET r25, r3, r14
  ADD r3, r9
  MOV r25, r1
  ADD r25, r7
  CMP r3, r25
  BLT r3, border_y

  ; Bottom edge
  MOV r3, r1
  ADD r3, r7
  SUB r3, r9         ; bottom y
  MOV r4, r6         ; x = win_x
bottom_x:
  PSET r4, r3, r14
  ADD r4, r9
  MOV r25, r6
  ADD r25, r13
  CMP r4, r25
  BLT r3, bottom_x

frame_done:
  POP r4
  POP r7
  POP r13
  POP r1
  POP r6
  POP r14
  POP r3
  POP r31
  RET
