; DESCRIPTION: A colored object centered at the screen with fixed size.

; replay_demo.asm -- Draw frames, then replay them backward
;
; Phase 38c demo: Uses SNAP_TRACE to record, FRAME to checkpoint,
; then REPLAY to display frames in reverse.
;
; Draws a vertical color bar that moves across the screen for 16 frames,
; then replays those frames backward using the REPLAY opcode.

  LDI r3, 1         ; mode = start recording
  SNAP_TRACE r3      ; begin trace recording

  LDI r6, 0         ; frame counter
  LDI r15, 16        ; total frames to draw
  LDI r4, 0         ; bar x position

draw_loop:
  ; Clear screen to black
  LDI r10, 0
  FILL r10

  ; Draw a vertical bar at position r4
  LDI r13, 0          ; y = 0
  LDI r11, 256        ; y limit
  LDI r1, 0x00FF00   ; green bar color
  LDI r9, 4          ; bar width

bar_y:
  ; Draw 4 pixels wide at (r4, r13)
  LDI r0, 0
bar_x:
  LDI r14, 0
  ADD r14, r4
  ADD r14, r0         ; x = bar_pos + offset
  SCREENP r14, r13, r1    ; set pixel
  LDI r7, 1
  ADD r0, r7
  CMP r0, r9
  BLT r2, bar_x

  LDI r7, 1
  ADD r13, r7
  CMP r13, r11
  BLT r2, bar_y

  ; Advance bar position
  LDI r7, 16
  ADD r4, r7

  ; Show frame (also triggers checkpoint since trace recording is on)
  FRAME

  LDI r7, 1
  ADD r6, r7
  CMP r6, r15
  BLT r2, draw_loop

  ; Stop recording
  LDI r3, 0
  SNAP_TRACE r3

  ; Now replay backward: show frames from newest to oldest
  LDI r8, 0         ; replay index (0 = newest)

replay_loop:
  LDI r3, 0
  ADD r3, r8        ; frame index to replay
  REPLAY r3

  ; Small delay between replay frames
  LDI r12, 0
delay:
  LDI r5, 1
  ADD r12, r5
  CMP r12, r15       ; short delay
  BLT r2, delay

  LDI r7, 1
  ADD r8, r7
  CMP r8, r15       ; replay all 16 frames
  BLT r2, replay_loop

  HALT
