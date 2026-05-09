; DESCRIPTION: Places a orange line segment connecting (296, 177) to (330, 85).
; PLAN: r0=296(x1), r1=177(y1), r2=330(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 177
LDI r2, 330
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
