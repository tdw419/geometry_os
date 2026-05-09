; DESCRIPTION: Places a green line segment connecting (352, 157) to (407, 147).
; PLAN: r0=352(x1), r1=157(y1), r2=407(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 157
LDI r2, 407
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
