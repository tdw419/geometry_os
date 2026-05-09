; DESCRIPTION: Renders a blue box of size 77x26 starting at (419, 64).
; PLAN: r0=419(x), r1=64(y), r2=77(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 64
LDI r2, 77
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
