; DESCRIPTION: Render a green object at the screen.

; window_desktop.asm -- Multi-window desktop demo (Phase 68b)
; Demonstrates WINSYS + MOUSEQ integration: drag, focus, multiple windows.
; Each window draws its own content into its offscreen buffer.
;
; Controls: Move mouse to interact. Click title bar to drag, click body to focus.
; Press Q to quit.

; ── Constants ──
LDI r12, 1
LDI r20, 0         ; zero constant

; ── Store title strings in RAM ──
LDI r3, 0x2000
STRO r3, "Hello"
LDI r3, 0x2020
STRO r3, "Counter"
LDI r3, 0x2040
STRO r3, "Colors"

; ── Create 3 windows ──

; Window 1: "Hello" at (20, 20), 100x80
LDI r15, 20
LDI r1, 20
LDI r7, 100
LDI r5, 80
LDI r10, 0x2000     ; title addr
LDI r3, 0          ; op=0 (create)
WINSYS r3
MOV r4, r9        ; r4 = win1_id

; Window 2: "Counter" at (140, 30), 100x80
LDI r15, 140
LDI r1, 30
LDI r7, 100
LDI r5, 80
LDI r10, 0x2020
LDI r3, 0
WINSYS r3
MOV r14, r9        ; r14 = win2_id

; Window 3: "Colors" at (60, 120), 100x80
LDI r15, 60
LDI r1, 120
LDI r7, 100
LDI r5, 80
LDI r10, 0x2040
LDI r3, 0
WINSYS r3
MOV r6, r9        ; r6 = win3_id

; ── Draw window contents ──

; Window 1: Green background with welcome text
CALL draw_win1

; Window 2: Blue background with counter
CALL draw_win2

; Window 3: Color stripes
CALL draw_win3

; ── Drag state ──
; r8 = dragging window id (0 = none)
; r16 = drag offset X
; r17 = drag offset Y
LDI r8, 0
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
  JZ r9, quit

  ; ── Handle mouse button ──
  LDI r25, 2
  CMP r23, r25      ; click?
  BGE r9, check_drag

  ; Fresh click -- do hittest
  LDI r3, 4         ; op=4 (hittest)
  WINSYS r3         ; r9=win_id, r15=hit_type

  ; If no hit, skip
  JZ r9, no_click_action

  ; Bring clicked window to front
  LDI r3, 2         ; op=2 (bring to front)
  WINSYS r3

  ; Check hit type -- title bar = start drag
  LDI r25, 1
  CMP r15, r25       ; r15 = hit_type from hittest
  JNZ r9, no_click_action

  ; Start dragging (title bar hit)
  MOV r8, r9       ; r8 = dragging win_id

  ; Get window info for drag offset
  MOV r9, r8
  LDI r15, 0x9000    ; winfo dest addr
  LDI r3, 6         ; op=6 (winfo)
  WINSYS r3

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
  JZ r8, no_click_action

  ; If button released (btn=0), stop dragging
  JZ r23, stop_drag

  ; Still dragging -- move window to mouse position
  MOV r9, r8       ; win_id
  MOV r15, r21
  SUB r15, r16       ; new_x = mx - drag_ox
  MOV r1, r22
  SUB r1, r17       ; new_y = my - drag_oy
  LDI r3, 5         ; op=5 (moveto)
  WINSYS r3

  JMP no_click_action

stop_drag:
  LDI r8, 0        ; stop dragging
  JMP no_click_action

no_click_action:

  ; ── Update counter (throttled to ~2/sec) ──
  LDI r25, 0xFFE
  LOAD r26, r25     ; TICKS
  LDI r27, 31
  AND r26, r27      ; TICKS & 31
  JNZ r26, skip_counter
  ADD r18, r12       ; counter++
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
  MOV r9, r4
  CALL draw_window_frame

  ; Window 2 border
  MOV r9, r14
  CALL draw_window_frame

  ; Window 3 border
  MOV r9, r6
  CALL draw_window_frame

  FRAME
  JMP main_loop

quit:
  HALT

; ── Draw Window 1: Green background ──
draw_win1:
  PUSH r31
  PUSH r9
  MOV r9, r4       ; win_id

  ; Fill with dark green
  LDI r7, 0x003300  ; dark green
  LDI r5, 0         ; y
fill1_loop:
  LDI r3, 0         ; x
fill1_x:
  WPIXEL r9, r3, r5, r7
  ADD r3, r12        ; x++
  LDI r25, 100
  CMP r3, r25
  BLT r9, fill1_x
  ADD r5, r12        ; y++
  LDI r25, 80
  CMP r5, r25
  BLT r9, fill1_loop

  ; Draw a bright green H in the center
  LDI r7, 0x00FF00  ; bright green
  ; Left vertical of H
  LDI r5, 30
  LDI r3, 40
h_left:
  WPIXEL r9, r3, r5, r7
  WPIXEL r9, r3, r5, r7
  ADD r5, r12
  LDI r25, 60
  CMP r5, r25
  BLT r9, h_left

  ; Right vertical of H
  LDI r5, 30
  LDI r3, 48
h_right:
  WPIXEL r9, r3, r5, r7
  ADD r5, r12
  LDI r25, 60
  CMP r5, r25
  BLT r9, h_right

  ; Crossbar of H
  LDI r5, 44
  LDI r3, 40
h_bar:
  WPIXEL r9, r3, r5, r7
  ADD r3, r12
  LDI r25, 49
  CMP r3, r25
  BLT r9, h_bar

  POP r9
  POP r31
  RET

; ── Draw Window 2: Blue background with counter bar ──
draw_win2:
  PUSH r31
  PUSH r9

  MOV r9, r14       ; win_id

  ; Fill with dark blue
  LDI r7, 0x000033  ; dark blue
  LDI r5, 0
fill2_loop:
  LDI r3, 0
fill2_x:
  WPIXEL r9, r3, r5, r7
  ADD r3, r12
  LDI r25, 100
  CMP r3, r25
  BLT r9, fill2_x
  ADD r5, r12
  LDI r25, 80
  CMP r5, r25
  BLT r9, fill2_loop

  ; Draw counter bar (white bar, length = counter % 90 + 5)
  LDI r7, 0xFFFFFF  ; white
  LDI r5, 40        ; y position
  MOV r10, r18
  LDI r25, 90
  MOD r10, r25
  ADD r10, r12        ; +1 = at least 1 pixel
  LDI r3, 5         ; x offset
bar_loop:
  CMP r3, r10
  BGE r9, bar_done
  WPIXEL r9, r3, r5, r7
  ADD r3, r12
  JMP bar_loop
bar_done:

  POP r9
  POP r31
  RET

; ── Draw Window 3: Animated color stripes ──
draw_win3:
  PUSH r31
  PUSH r9
  PUSH r15
  PUSH r1

  MOV r9, r6       ; win_id

  ; Get ticks for animation
  LDI r25, 0xFFE
  LOAD r26, r25     ; ticks

  ; Fill with animated stripes
  LDI r5, 0         ; y
stripe_y:
  LDI r3, 0         ; x
stripe_x:
  ; Color from position + time
  MOV r15, r3
  ADD r15, r26       ; x + ticks
  LDI r25, 31
  AND r15, r25       ; (x + ticks) & 31
  LDI r25, 3
  MUL r15, r25       ; 0-93
  LDI r25, 8
  SHL r15, r25       ; shift into green channel
  MOV r7, r5
  LDI r1, 7
  AND r7, r1        ; y & 7
  LDI r25, 16
  SHL r7, r25       ; red channel
  OR r15, r7         ; combine
  MOV r7, r15

  WPIXEL r9, r3, r5, r7
  ADD r3, r12        ; x++
  LDI r25, 100
  CMP r3, r25
  BLT r9, stripe_x

  ADD r5, r12        ; y++
  LDI r25, 80
  CMP r5, r25
  BLT r9, stripe_y

  POP r1
  POP r15
  POP r9
  POP r31
  RET

; ── Draw window frame (title bar + border) on screen ──
; r9 = win_id
draw_window_frame:
  PUSH r31
  PUSH r9
  PUSH r15
  PUSH r1
  PUSH r7
  PUSH r5
  PUSH r10
  PUSH r3

  ; Get window info
  MOV r9, r9
  LDI r15, 0x9200    ; winfo addr
  LDI r3, 6         ; WINFO
  WINSYS r3
  JZ r9, frame_done  ; window not found

  LOAD r1, 0x9200   ; win_x
  LOAD r7, 0x9201   ; win_y
  LOAD r5, 0x9202   ; win_w
  LOAD r10, 0x9203   ; win_h

  ; Title bar (12px tall, purple)
  LDI r15, 0x444488
  MOV r3, r7         ; y = win_y
title_y:
  MOV r9, r1         ; x = win_x
title_x:
  PSET r9, r3, r15
  ADD r9, r12
  MOV r25, r1
  ADD r25, r5        ; x limit
  CMP r9, r25
  BLT r9, title_x
  ADD r3, r12
  LDI r25, 12
  ADD r25, r7        ; y limit (win_y + 12)
  CMP r3, r25
  BLT r9, title_y

  ; Border outline (gray)
  LDI r15, 0x888888
  ; Left + right edges
  MOV r9, r7         ; y = win_y
border_y:
  PSET r1, r9, r15    ; left edge
  MOV r25, r1
  ADD r25, r5
  SUB r25, r12        ; right edge x
  PSET r25, r9, r15
  ADD r9, r12
  MOV r25, r7
  ADD r25, r10
  CMP r9, r25
  BLT r9, border_y

  ; Bottom edge
  MOV r9, r7
  ADD r9, r10
  SUB r9, r12         ; bottom y
  MOV r3, r1         ; x = win_x
bottom_x:
  PSET r3, r9, r15
  ADD r3, r12
  MOV r25, r1
  ADD r25, r5
  CMP r3, r25
  BLT r9, bottom_x

frame_done:
  POP r3
  POP r10
  POP r5
  POP r7
  POP r1
  POP r15
  POP r9
  POP r31
  RET
