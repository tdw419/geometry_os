; DESCRIPTION: This GeOS assembly code records and displays a vertical color bar moving across the screen for 16 frames, then replays those frames backward using the REPLAY opcode. The code utilizes SNAP_TRACE to start and stop recording, FRAME to checkpoint each frame during drawing, and SCREENP to draw pixels on the screen.

; replay_demo.asm -- Draw frames, then replay them backward
;
; Phase 38c demo: Uses SNAP_TRACE to record, FRAME to checkpoint,
; then REPLAY to display frames in reverse.
;
; Draws a vertical color bar that moves across the screen for 16 frames,
; then replays those frames backward using the REPLAY opcode.

  LDI r4, 1         ; mode = start recording
  SNAP_TRACE r4      ; begin trace recording

  LDI r2, 0         ; frame counter
  LDI r12, 16        ; total frames to draw
  LDI r8, 0         ; bar x position

draw_loop:
  ; Clear screen to black
  LDI r10, 0
  FILL r10

  ; Draw a vertical bar at position r8
  LDI r1, 0          ; y = 0
  LDI r0, 256        ; y limit
  LDI r11, 0x00FF00   ; green bar color
  LDI r13, 4          ; bar width

bar_y:
  ; Draw 4 pixels wide at (r8, r1)
  LDI r6, 0
bar_x:
  LDI r5, 0
  ADD r5, r8
  ADD r5, r6         ; x = bar_pos + offset
  SCREENP r5, r1, r11    ; set pixel
  LDI r7, 1
  ADD r6, r7
  CMP r6, r13
  BLT r14, bar_x

  LDI r7, 1
  ADD r1, r7
  CMP r1, r0
  BLT r14, bar_y

  ; Advance bar position
  LDI r7, 16
  ADD r8, r7

  ; Show frame (also triggers checkpoint since trace recording is on)
  FRAME

  LDI r7, 1
  ADD r2, r7
  CMP r2, r12
  BLT r14, draw_loop

  ; Stop recording
  LDI r4, 0
  SNAP_TRACE r4

  ; Now replay backward: show frames from newest to oldest
  LDI r3, 0         ; replay index (0 = newest)

replay_loop:
  LDI r4, 0
  ADD r4, r3        ; frame index to replay
  REPLAY r4

  ; Small delay between replay frames
  LDI r9, 0
delay:
  LDI r15, 1
  ADD r9, r15
  CMP r9, r12       ; short delay
  BLT r14, delay

  LDI r7, 1
  ADD r3, r7
  CMP r3, r12       ; replay all 16 frames
  BLT r14, replay_loop

  HALT
