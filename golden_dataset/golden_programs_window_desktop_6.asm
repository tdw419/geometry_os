; DESCRIPTION: A green object centered at the screen with fixed size.

; window_desktop.asm -- Multi-window desktop demo (Phase 68b)
; Demonstrates WINSYS + MOUSEQ integration: drag, focus, multiple windows.
; Each window draws its own content into its offscreen buffer.
;
; Controls: Move mouse to interact. Click title bar to drag, click body to focus.
; Press Q to quit.

; ── Constants ──
LDI r3, 1
LDI r20, 0         ; zero constant

; ── Store title strings in RAM ──
LDI r7, 0x2000
STRO r7, "Hello"
LDI r7, 0x2020
STRO r7, "Counter"
LDI r7, 0x2040
STRO r7, "Colors"

; ── Create 3 windows ──

; Window 1: "Hello" at (20, 20), 100x80
LDI r9, 20
LDI r8, 20
LDI r15, 100
LDI r1, 80
LDI r11, 0x2000     ; title addr
LDI r7, 0          ; op=0 (create)
WINSYS r7
MOV r12, r13        ; r12 = win1_id

; Window 2: "Counter" at (140, 30), 100x80
LDI r9, 140
LDI r8, 30
LDI r15, 100
LDI r1, 80
LDI r11, 0x2020
LDI r7, 0
WINSYS r7
MOV r10, r13        ; r10 = win2_id

; Window 3: "Colors" at (60, 120), 100x80
LDI r9, 60
LDI r8, 120
LDI r15, 100
LDI r1, 80
LDI r11, 0x2040
LDI r7, 0
WINSYS r7
MOV r14, r13        ; r14 = win3_id

; ── Draw window contents ──

; Window 1: Green background with welcome text
CALL draw_win1

; Window 2: Blue background with counter
CALL draw_win2

; Window 3: Color stripes
CALL draw_win3

; ── Drag state ──
; r6 = dragging window id (0 = none)
; r16 = drag offset X
; r17 = drag offset Y
LDI r6, 0
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
  JZ r13, quit

  ; ── Handle mouse button ──
  LDI r25, 2
  CMP r23, r25      ; click?
  BGE r13, check_drag

  ; Fresh click -- do hittest
  LDI r7, 4         ; op=4 (hittest)
  WINSYS r7         ; r13=win_id, r9=hit_type

  ; If no hit, skip
  JZ r13, no_click_action

  ; Bring clicked window to front
  LDI r7, 2         ; op=2 (bring to front)
  WINSYS r7

  ; Check hit type -- title bar = start drag
  LDI r25, 1
  CMP r9, r25       ; r9 = hit_type from hittest
  JNZ r13, no_click_action

  ; Start dragging (title bar hit)
  MOV r6, r13       ; r6 = dragging win_id

  ; Get window info for drag offset
  MOV r13, r6
  LDI r9, 0x9000    ; winfo dest addr
  LDI r7, 6         ; op=6 (winfo)
  WINSYS r7

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
  JZ r6, no_click_action

  ; If button released (btn=0), stop dragging
  JZ r23, stop_drag

  ; Still dragging -- move window to mouse position
  MOV r13, r6       ; win_id
  MOV r9, r21
  SUB r9, r16       ; new_x = mx - drag_ox
  MOV r8, r22
  SUB r8, r17       ; new_y = my - drag_oy
  LDI r7, 5         ; op=5 (moveto)
  WINSYS r7

  JMP no_click_action

stop_drag:
  LDI r6, 0        ; stop dragging
  JMP no_click_action

no_click_action:

  ; ── Update counter (throttled to ~2/sec) ──
  LDI r25, 0xFFE
  LOAD r26, r25     ; TICKS
  LDI r27, 31
  AND r26, r27      ; TICKS & 31
  JNZ r26, skip_counter
  ADD r18, r3       ; counter++
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
  MOV r13, r12
  CALL draw_window_frame

  ; Window 2 border
  MOV r13, r10
  CALL draw_window_frame

  ; Window 3 border
  MOV r13, r14
  CALL draw_window_frame

  FRAME
  JMP main_loop

quit:
  HALT

; ── Draw Window 1: Green background ──
draw_win1:
  PUSH r31
  PUSH r13
  MOV r13, r12       ; win_id

  ; Fill with dark green
  LDI r15, 0x003300  ; dark green
  LDI r1, 0         ; y
fill1_loop:
  LDI r7, 0         ; x
fill1_x:
  WPIXEL r13, r7, r1, r15
  ADD r7, r3        ; x++
  LDI r25, 100
  CMP r7, r25
  BLT r13, fill1_x
  ADD r1, r3        ; y++
  LDI r25, 80
  CMP r1, r25
  BLT r13, fill1_loop

  ; Draw a bright green H in the center
  LDI r15, 0x00FF00  ; bright green
  ; Left vertical of H
  LDI r1, 30
  LDI r7, 40
h_left:
  WPIXEL r13, r7, r1, r15
  WPIXEL r13, r7, r1, r15
  ADD r1, r3
  LDI r25, 60
  CMP r1, r25
  BLT r13, h_left

  ; Right vertical of H
  LDI r1, 30
  LDI r7, 48
h_right:
  WPIXEL r13, r7, r1, r15
  ADD r1, r3
  LDI r25, 60
  CMP r1, r25
  BLT r13, h_right

  ; Crossbar of H
  LDI r1, 44
  LDI r7, 40
h_bar:
  WPIXEL r13, r7, r1, r15
  ADD r7, r3
  LDI r25, 49
  CMP r7, r25
  BLT r13, h_bar

  POP r13
  POP r31
  RET

; ── Draw Window 2: Blue background with counter bar ──
draw_win2:
  PUSH r31
  PUSH r13

  MOV r13, r10       ; win_id

  ; Fill with dark blue
  LDI r15, 0x000033  ; dark blue
  LDI r1, 0
fill2_loop:
  LDI r7, 0
fill2_x:
  WPIXEL r13, r7, r1, r15
  ADD r7, r3
  LDI r25, 100
  CMP r7, r25
  BLT r13, fill2_x
  ADD r1, r3
  LDI r25, 80
  CMP r1, r25
  BLT r13, fill2_loop

  ; Draw counter bar (white bar, length = counter % 90 + 5)
  LDI r15, 0xFFFFFF  ; white
  LDI r1, 40        ; y position
  MOV r11, r18
  LDI r25, 90
  MOD r11, r25
  ADD r11, r3        ; +1 = at least 1 pixel
  LDI r7, 5         ; x offset
bar_loop:
  CMP r7, r11
  BGE r13, bar_done
  WPIXEL r13, r7, r1, r15
  ADD r7, r3
  JMP bar_loop
bar_done:

  POP r13
  POP r31
  RET

; ── Draw Window 3: Animated color stripes ──
draw_win3:
  PUSH r31
  PUSH r13
  PUSH r9
  PUSH r8

  MOV r13, r14       ; win_id

  ; Get ticks for animation
  LDI r25, 0xFFE
  LOAD r26, r25     ; ticks

  ; Fill with animated stripes
  LDI r1, 0         ; y
stripe_y:
  LDI r7, 0         ; x
stripe_x:
  ; Color from position + time
  MOV r9, r7
  ADD r9, r26       ; x + ticks
  LDI r25, 31
  AND r9, r25       ; (x + ticks) & 31
  LDI r25, 3
  MUL r9, r25       ; 0-93
  LDI r25, 8
  SHL r9, r25       ; shift into green channel
  MOV r15, r1
  LDI r8, 7
  AND r15, r8        ; y & 7
  LDI r25, 16
  SHL r15, r25       ; red channel
  OR r9, r15         ; combine
  MOV r15, r9

  WPIXEL r13, r7, r1, r15
  ADD r7, r3        ; x++
  LDI r25, 100
  CMP r7, r25
  BLT r13, stripe_x

  ADD r1, r3        ; y++
  LDI r25, 80
  CMP r1, r25
  BLT r13, stripe_y

  POP r8
  POP r9
  POP r13
  POP r31
  RET

; ── Draw window frame (title bar + border) on screen ──
; r13 = win_id
draw_window_frame:
  PUSH r31
  PUSH r13
  PUSH r9
  PUSH r8
  PUSH r15
  PUSH r1
  PUSH r11
  PUSH r7

  ; Get window info
  MOV r13, r13
  LDI r9, 0x9200    ; winfo addr
  LDI r7, 6         ; WINFO
  WINSYS r7
  JZ r13, frame_done  ; window not found

  LOAD r8, 0x9200   ; win_x
  LOAD r15, 0x9201   ; win_y
  LOAD r1, 0x9202   ; win_w
  LOAD r11, 0x9203   ; win_h

  ; Title bar (12px tall, purple)
  LDI r9, 0x444488
  MOV r7, r15         ; y = win_y
title_y:
  MOV r13, r8         ; x = win_x
title_x:
  PSET r13, r7, r9
  ADD r13, r3
  MOV r25, r8
  ADD r25, r1        ; x limit
  CMP r13, r25
  BLT r13, title_x
  ADD r7, r3
  LDI r25, 12
  ADD r25, r15        ; y limit (win_y + 12)
  CMP r7, r25
  BLT r13, title_y

  ; Border outline (gray)
  LDI r9, 0x888888
  ; Left + right edges
  MOV r13, r15         ; y = win_y
border_y:
  PSET r8, r13, r9    ; left edge
  MOV r25, r8
  ADD r25, r1
  SUB r25, r3        ; right edge x
  PSET r25, r13, r9
  ADD r13, r3
  MOV r25, r15
  ADD r25, r11
  CMP r13, r25
  BLT r13, border_y

  ; Bottom edge
  MOV r13, r15
  ADD r13, r11
  SUB r13, r3         ; bottom y
  MOV r7, r8         ; x = win_x
bottom_x:
  PSET r7, r13, r9
  ADD r7, r3
  MOV r25, r8
  ADD r25, r1
  CMP r7, r25
  BLT r13, bottom_x

frame_done:
  POP r7
  POP r11
  POP r1
  POP r15
  POP r8
  POP r9
  POP r13
  POP r31
  RET
