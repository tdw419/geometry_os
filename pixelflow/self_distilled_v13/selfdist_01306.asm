; DESCRIPTION: Renders a orange line segment connecting (189, 91) to (242, 66).
; PLAN: r0=189(x1), r1=91(y1), r2=242(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 91
LDI r2, 242
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
