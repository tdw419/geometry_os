; DESCRIPTION: Renders a orange line between points (386, 91) and (427, 156).
; PLAN: r0=386(x1), r1=91(y1), r2=427(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 91
LDI r2, 427
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
