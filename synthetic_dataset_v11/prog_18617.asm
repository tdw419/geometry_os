; DESCRIPTION: Renders a green box of size 110x91 starting at (44, 75).
; PLAN: r0=44(x), r1=75(y), r2=110(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 75
LDI r2, 110
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
