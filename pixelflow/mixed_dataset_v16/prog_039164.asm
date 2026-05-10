; DESCRIPTION: Places a purple line segment connecting (486, 157) to (333, 229).
; PLAN: r0=486(x1), r1=157(y1), r2=333(x2), r3=229(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 157
LDI r2, 333
LDI r3, 229
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
