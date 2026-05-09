; DESCRIPTION: Renders a blue box of size 89x87 starting at (370, 64).
; PLAN: r0=370(x), r1=64(y), r2=89(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 64
LDI r2, 89
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
