; DESCRIPTION: Places a purple line segment connecting (229, 159) to (229, 246).
; PLAN: r0=229(x1), r1=159(y1), r2=229(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 159
LDI r2, 229
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
