; DESCRIPTION: Renders a blue box of size 66x37 starting at (76, 4).
; PLAN: r0=76(x), r1=4(y), r2=66(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 4
LDI r2, 66
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
