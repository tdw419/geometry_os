; DESCRIPTION: Places a orange line segment connecting (81, 91) to (65, 82).
; PLAN: r0=81(x1), r1=91(y1), r2=65(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 91
LDI r2, 65
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
