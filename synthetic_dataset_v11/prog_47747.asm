; DESCRIPTION: Renders a green box of size 91x109 starting at (125, 106).
; PLAN: r0=125(x), r1=106(y), r2=91(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 106
LDI r2, 91
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
