; DESCRIPTION: Renders a green box of size 91x107 starting at (402, 106).
; PLAN: r0=402(x), r1=106(y), r2=91(width), r3=107(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 106
LDI r2, 91
LDI r3, 107
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
