; DESCRIPTION: This GeOS assembly code demonstrates a simple multiprocess system where two processes run concurrently. The primary process draws a bouncing white dot in the left half of a 256x256 screen, while a spawned process simultaneously draws a bouncing red dot in the right half. Both dots bounce off the screen boundaries and share the same display buffer, with the primary process handling frame synchronization.

; multiproc.asm -- SPATIAL_SPAWN demo
;
; Primary process: draws a bouncing white dot in the LEFT half (x: 0..127)
; Spawned process: draws a bouncing red  dot in the RIGHT half (x: 128..255)
; Both share the same 256x256 screen and run concurrently via SPAWN.
;
; Register layout (primary):
;   r1 = x position
;   r0 = y position
;   r8 = vx (velocity x)
;   r7 = vy (velocity y)
;   r9 = color (white)
;   r4 = scratch
;   r3 = spawn address

; ── init primary ──────────────────────────────────────────────────────────────
  LDI r1, 32          ; start x = 32 (left half)
  LDI r0, 128         ; start y = 128
  LDI r8, 1           ; vx = +1
  LDI r7, 1           ; vy = +1
  LDI r9, 0xFFFFFF    ; white

  ; spawn the red-dot process
  LDI r3, red_proc
  SPAWN r3

; ── primary game loop ─────────────────────────────────────────────────────────
loop:
  ; erase old pixel
  LDI r4, 0
  PSET r1, r0, r4

  ; move
  ADD r1, r8
  ADD r0, r7

  ; bounce left wall (x = 0)
  LDI r4, 0
  CMP r1, r4
  JNZ r4, chk_rw
  LDI r8, 1
chk_rw:
  ; bounce right wall of left half (x = 127)
  LDI r4, 127
  CMP r1, r4
  JNZ r4, chk_tw
  LDI r8, 0xFFFFFFFF
chk_tw:
  ; bounce top wall (y = 0)
  LDI r4, 0
  CMP r0, r4
  JNZ r4, chk_bw
  LDI r7, 1
chk_bw:
  ; bounce bottom wall (y = 255)
  LDI r4, 255
  CMP r0, r4
  JNZ r4, draw
  LDI r7, 0xFFFFFFFF

draw:
  PSET r1, r0, r9
  FRAME
  JMP loop

; ── spawned process: red dot in right half ─────────────────────────────────────
; Spawned processes start with zeroed registers, so we initialise everything here.
red_proc:
  LDI r1, 196         ; start x = 196 (right half)
  LDI r0, 64          ; start y = 64
  LDI r8, 0xFFFFFFFF          ; vx = -1
  LDI r7, 1           ; vy = +1
  LDI r9, 0xFF2020    ; red

red_loop:
  ; erase
  LDI r4, 0
  PSET r1, r0, r4

  ; move
  ADD r1, r8
  ADD r0, r7

  ; bounce left wall of right half (x = 128)
  LDI r4, 128
  CMP r1, r4
  JNZ r4, red_chk_rw
  LDI r8, 1
red_chk_rw:
  ; bounce right wall (x = 255)
  LDI r4, 255
  CMP r1, r4
  JNZ r4, red_chk_tw
  LDI r8, 0xFFFFFFFF
red_chk_tw:
  ; bounce top (y = 0)
  LDI r4, 0
  CMP r0, r4
  JNZ r4, red_chk_bw
  LDI r7, 1
red_chk_bw:
  ; bounce bottom (y = 255)
  LDI r4, 255
  CMP r0, r4
  JNZ r4, red_draw
  LDI r7, 0xFFFFFFFF
red_draw:
  PSET r1, r0, r9
  ; No FRAME here — the primary process drives frame sync
  JMP red_loop
