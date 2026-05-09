; DESCRIPTION: Renders a yellow box of size 105x75 starting at (85, 130).
; PLAN: r0=85(x), r1=130(y), r2=105(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 130
LDI r2, 105
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
