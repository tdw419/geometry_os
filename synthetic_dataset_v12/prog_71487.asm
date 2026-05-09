; DESCRIPTION: Places a orange line segment connecting (208, 172) to (337, 126).
; PLAN: r0=208(x1), r1=172(y1), r2=337(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 172
LDI r2, 337
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
