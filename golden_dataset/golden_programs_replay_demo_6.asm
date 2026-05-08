; DESCRIPTION: This GeOS assembly code records and displays a vertical color bar moving across the screen for 16 frames, then replays those frames backward using the REPLAY opcode. The code utilizes SNAP_TRACE to start and stop recording, FRAME to checkpoint each frame during drawing, and SCREENP to draw pixels on the screen.

; replay_demo.asm -- Draw frames, then replay them backward
;
; Phase 38c demo: Uses SNAP_TRACE to record, FRAME to checkpoint,
; then REPLAY to display frames in reverse.
;
; Draws a vertical color bar that moves across the screen for 16 frames,
; then replays those frames backward using the REPLAY opcode.

  LDI r1, 1         ; mode = start recording
  SNAP_TRACE r1      ; begin trace recording

  LDI r9, 0         ; frame counter
  LDI r14, 16        ; total frames to draw
  LDI r12, 0         ; bar x position

draw_loop:
  ; Clear screen to black
  LDI r5, 0
  FILL r5

  ; Draw a vertical bar at position r12
  LDI r6, 0          ; y = 0
  LDI r4, 256        ; y limit
  LDI r13, 0x00FF00   ; green bar color
  LDI r11, 4          ; bar width

bar_y:
  ; Draw 4 pixels wide at (r12, r6)
  LDI r7, 0
bar_x:
  LDI r3, 0
  ADD r3, r12
  ADD r3, r7         ; x = bar_pos + offset
  SCREENP r3, r6, r13    ; set pixel
  LDI r10, 1
  ADD r7, r10
  CMP r7, r11
  BLT r15, bar_x

  LDI r10, 1
  ADD r6, r10
  CMP r6, r4
  BLT r15, bar_y

  ; Advance bar position
  LDI r10, 16
  ADD r12, r10

  ; Show frame (also triggers checkpoint since trace recording is on)
  FRAME

  LDI r10, 1
  ADD r9, r10
  CMP r9, r14
  BLT r15, draw_loop

  ; Stop recording
  LDI r1, 0
  SNAP_TRACE r1

  ; Now replay backward: show frames from newest to oldest
  LDI r2, 0         ; replay index (0 = newest)

replay_loop:
  LDI r1, 0
  ADD r1, r2        ; frame index to replay
  REPLAY r1

  ; Small delay between replay frames
  LDI r0, 0
delay:
  LDI r8, 1
  ADD r0, r8
  CMP r0, r14       ; short delay
  BLT r15, delay

  LDI r10, 1
  ADD r2, r10
  CMP r2, r14       ; replay all 16 frames
  BLT r15, replay_loop

  HALT
