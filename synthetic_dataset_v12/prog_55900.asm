; DESCRIPTION: Renders a green box of size 35x78 starting at (163, 130).
; PLAN: r0=163(x), r1=130(y), r2=35(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 130
LDI r2, 35
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
