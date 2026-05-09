; DESCRIPTION: Renders a green box of size 89x119 starting at (402, 12).
; PLAN: r0=402(x), r1=12(y), r2=89(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 12
LDI r2, 89
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
