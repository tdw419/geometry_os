; DESCRIPTION: Render a red object at the screen.

; multiproc.asm -- SPATIAL_SPAWN demo
;
; Primary process: draws a bouncing white dot in the LEFT half (x: 0..127)
; Spawned process: draws a bouncing red  dot in the RIGHT half (x: 128..255)
; Both share the same 256x256 screen and run concurrently via SPAWN.
;
; Register layout (primary):
;   r14 = x position
;   r10 = y position
;   r9 = vx (velocity x)
;   r0 = vy (velocity y)
;   r3 = color (white)
;   r15 = scratch
;   r8 = spawn address

; ── init primary ──────────────────────────────────────────────────────────────
  LDI r14, 32          ; start x = 32 (left half)
  LDI r10, 128         ; start y = 128
  LDI r9, 1           ; vx = +1
  LDI r0, 1           ; vy = +1
  LDI r3, 0xFFFFFF    ; white

  ; spawn the red-dot process
  LDI r8, red_proc
  SPAWN r8

; ── primary game loop ─────────────────────────────────────────────────────────
loop:
  ; erase old pixel
  LDI r15, 0
  PSET r14, r10, r15

  ; move
  ADD r14, r9
  ADD r10, r0

  ; bounce left wall (x = 0)
  LDI r15, 0
  CMP r14, r15
  JNZ r15, chk_rw
  LDI r9, 1
chk_rw:
  ; bounce right wall of left half (x = 127)
  LDI r15, 127
  CMP r14, r15
  JNZ r15, chk_tw
  LDI r9, 0xFFFFFFFF
chk_tw:
  ; bounce top wall (y = 0)
  LDI r15, 0
  CMP r10, r15
  JNZ r15, chk_bw
  LDI r0, 1
chk_bw:
  ; bounce bottom wall (y = 255)
  LDI r15, 255
  CMP r10, r15
  JNZ r15, draw
  LDI r0, 0xFFFFFFFF

draw:
  PSET r14, r10, r3
  FRAME
  JMP loop

; ── spawned process: red dot in right half ─────────────────────────────────────
; Spawned processes start with zeroed registers, so we initialise everything here.
red_proc:
  LDI r14, 196         ; start x = 196 (right half)
  LDI r10, 64          ; start y = 64
  LDI r9, 0xFFFFFFFF          ; vx = -1
  LDI r0, 1           ; vy = +1
  LDI r3, 0xFF2020    ; red

red_loop:
  ; erase
  LDI r15, 0
  PSET r14, r10, r15

  ; move
  ADD r14, r9
  ADD r10, r0

  ; bounce left wall of right half (x = 128)
  LDI r15, 128
  CMP r14, r15
  JNZ r15, red_chk_rw
  LDI r9, 1
red_chk_rw:
  ; bounce right wall (x = 255)
  LDI r15, 255
  CMP r14, r15
  JNZ r15, red_chk_tw
  LDI r9, 0xFFFFFFFF
red_chk_tw:
  ; bounce top (y = 0)
  LDI r15, 0
  CMP r10, r15
  JNZ r15, red_chk_bw
  LDI r0, 1
red_chk_bw:
  ; bounce bottom (y = 255)
  LDI r15, 255
  CMP r10, r15
  JNZ r15, red_draw
  LDI r0, 0xFFFFFFFF
red_draw:
  PSET r14, r10, r3
  ; No FRAME here — the primary process drives frame sync
  JMP red_loop
