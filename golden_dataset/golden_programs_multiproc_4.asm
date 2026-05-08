; DESCRIPTION: This GeOS assembly code demonstrates a simple multiprocess system where two processes run concurrently. The primary process draws a bouncing white dot in the left half of a 256x256 screen, while a spawned process simultaneously draws a bouncing red dot in the right half. Both dots bounce off the screen boundaries and share the same display buffer, with the primary process handling frame synchronization.

; multiproc.asm -- SPATIAL_SPAWN demo
;
; Primary process: draws a bouncing white dot in the LEFT half (x: 0..127)
; Spawned process: draws a bouncing red  dot in the RIGHT half (x: 128..255)
; Both share the same 256x256 screen and run concurrently via SPAWN.
;
; Register layout (primary):
;   r1 = x position
;   r10 = y position
;   r8 = vx (velocity x)
;   r3 = vy (velocity y)
;   r9 = color (white)
;   r12 = scratch
;   r4 = spawn address

; ── init primary ──────────────────────────────────────────────────────────────
  LDI r1, 32          ; start x = 32 (left half)
  LDI r10, 128         ; start y = 128
  LDI r8, 1           ; vx = +1
  LDI r3, 1           ; vy = +1
  LDI r9, 0xFFFFFF    ; white

  ; spawn the red-dot process
  LDI r4, red_proc
  SPAWN r4

; ── primary game loop ─────────────────────────────────────────────────────────
loop:
  ; erase old pixel
  LDI r12, 0
  PSET r1, r10, r12

  ; move
  ADD r1, r8
  ADD r10, r3

  ; bounce left wall (x = 0)
  LDI r12, 0
  CMP r1, r12
  JNZ r12, chk_rw
  LDI r8, 1
chk_rw:
  ; bounce right wall of left half (x = 127)
  LDI r12, 127
  CMP r1, r12
  JNZ r12, chk_tw
  LDI r8, 0xFFFFFFFF
chk_tw:
  ; bounce top wall (y = 0)
  LDI r12, 0
  CMP r10, r12
  JNZ r12, chk_bw
  LDI r3, 1
chk_bw:
  ; bounce bottom wall (y = 255)
  LDI r12, 255
  CMP r10, r12
  JNZ r12, draw
  LDI r3, 0xFFFFFFFF

draw:
  PSET r1, r10, r9
  FRAME
  JMP loop

; ── spawned process: red dot in right half ─────────────────────────────────────
; Spawned processes start with zeroed registers, so we initialise everything here.
red_proc:
  LDI r1, 196         ; start x = 196 (right half)
  LDI r10, 64          ; start y = 64
  LDI r8, 0xFFFFFFFF          ; vx = -1
  LDI r3, 1           ; vy = +1
  LDI r9, 0xFF2020    ; red

red_loop:
  ; erase
  LDI r12, 0
  PSET r1, r10, r12

  ; move
  ADD r1, r8
  ADD r10, r3

  ; bounce left wall of right half (x = 128)
  LDI r12, 128
  CMP r1, r12
  JNZ r12, red_chk_rw
  LDI r8, 1
red_chk_rw:
  ; bounce right wall (x = 255)
  LDI r12, 255
  CMP r1, r12
  JNZ r12, red_chk_tw
  LDI r8, 0xFFFFFFFF
red_chk_tw:
  ; bounce top (y = 0)
  LDI r12, 0
  CMP r10, r12
  JNZ r12, red_chk_bw
  LDI r3, 1
red_chk_bw:
  ; bounce bottom (y = 255)
  LDI r12, 255
  CMP r10, r12
  JNZ r12, red_draw
  LDI r3, 0xFFFFFFFF
red_draw:
  PSET r1, r10, r9
  ; No FRAME here — the primary process drives frame sync
  JMP red_loop
