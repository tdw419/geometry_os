; DESCRIPTION: Places a yellow line segment connecting (427, 144) to (501, 27).
; PLAN: r0=427(x1), r1=144(y1), r2=501(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 144
LDI r2, 501
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
