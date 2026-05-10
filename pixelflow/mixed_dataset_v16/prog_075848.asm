; DESCRIPTION: Places a blue 64x35 box at position (20, 141).
; PLAN: r0=20(x), r1=141(y), r2=64(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 141
LDI r2, 64
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
