; DESCRIPTION: Places a magenta line segment connecting (427, 236) to (364, 9).
; PLAN: r0=427(x1), r1=236(y1), r2=364(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 236
LDI r2, 364
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
