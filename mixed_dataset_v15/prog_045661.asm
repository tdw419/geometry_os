; DESCRIPTION: Renders a orange line between points (242, 100) and (431, 156).
; PLAN: r0=242(x1), r1=100(y1), r2=431(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 100
LDI r2, 431
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
