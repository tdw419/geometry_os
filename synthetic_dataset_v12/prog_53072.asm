; DESCRIPTION: Places a blue 51x64 rectangle at position (382, 36).
; PLAN: r0=382(x), r1=36(y), r2=51(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 36
LDI r2, 51
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
