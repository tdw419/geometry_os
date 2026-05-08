; DESCRIPTION: Geometry OS program to draw a red object.

; multiproc.asm -- SPATIAL_SPAWN demo
;
; Primary process: draws a bouncing white dot in the LEFT half (x: 0..127)
; Spawned process: draws a bouncing red  dot in the RIGHT half (x: 128..255)
; Both share the same 256x256 screen and run concurrently via SPAWN.
;
; Register layout (primary):
;   r10 = x position
;   r12 = y position
;   r15 = vx (velocity x)
;   r8 = vy (velocity y)
;   r4 = color (white)
;   r2 = scratch
;   r13 = spawn address

; ── init primary ──────────────────────────────────────────────────────────────
  LDI r10, 32          ; start x = 32 (left half)
  LDI r12, 128         ; start y = 128
  LDI r15, 1           ; vx = +1
  LDI r8, 1           ; vy = +1
  LDI r4, 0xFFFFFF    ; white

  ; spawn the red-dot process
  LDI r13, red_proc
  SPAWN r13

; ── primary game loop ─────────────────────────────────────────────────────────
loop:
  ; erase old pixel
  LDI r2, 0
  PSET r10, r12, r2

  ; move
  ADD r10, r15
  ADD r12, r8

  ; bounce left wall (x = 0)
  LDI r2, 0
  CMP r10, r2
  JNZ r2, chk_rw
  LDI r15, 1
chk_rw:
  ; bounce right wall of left half (x = 127)
  LDI r2, 127
  CMP r10, r2
  JNZ r2, chk_tw
  LDI r15, 0xFFFFFFFF
chk_tw:
  ; bounce top wall (y = 0)
  LDI r2, 0
  CMP r12, r2
  JNZ r2, chk_bw
  LDI r8, 1
chk_bw:
  ; bounce bottom wall (y = 255)
  LDI r2, 255
  CMP r12, r2
  JNZ r2, draw
  LDI r8, 0xFFFFFFFF

draw:
  PSET r10, r12, r4
  FRAME
  JMP loop

; ── spawned process: red dot in right half ─────────────────────────────────────
; Spawned processes start with zeroed registers, so we initialise everything here.
red_proc:
  LDI r10, 196         ; start x = 196 (right half)
  LDI r12, 64          ; start y = 64
  LDI r15, 0xFFFFFFFF          ; vx = -1
  LDI r8, 1           ; vy = +1
  LDI r4, 0xFF2020    ; red

red_loop:
  ; erase
  LDI r2, 0
  PSET r10, r12, r2

  ; move
  ADD r10, r15
  ADD r12, r8

  ; bounce left wall of right half (x = 128)
  LDI r2, 128
  CMP r10, r2
  JNZ r2, red_chk_rw
  LDI r15, 1
red_chk_rw:
  ; bounce right wall (x = 255)
  LDI r2, 255
  CMP r10, r2
  JNZ r2, red_chk_tw
  LDI r15, 0xFFFFFFFF
red_chk_tw:
  ; bounce top (y = 0)
  LDI r2, 0
  CMP r12, r2
  JNZ r2, red_chk_bw
  LDI r8, 1
red_chk_bw:
  ; bounce bottom (y = 255)
  LDI r2, 255
  CMP r12, r2
  JNZ r2, red_draw
  LDI r8, 0xFFFFFFFF
red_draw:
  PSET r10, r12, r4
  ; No FRAME here — the primary process drives frame sync
  JMP red_loop
