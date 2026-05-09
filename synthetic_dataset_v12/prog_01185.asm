; DESCRIPTION: Renders a blue box of size 31x48 starting at (89, 157).
; PLAN: r0=89(x), r1=157(y), r2=31(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 157
LDI r2, 31
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
