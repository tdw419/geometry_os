; DESCRIPTION: Places a orange line segment connecting (311, 185) to (146, 183).
; PLAN: r0=311(x1), r1=185(y1), r2=146(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 185
LDI r2, 146
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
