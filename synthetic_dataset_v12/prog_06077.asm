; DESCRIPTION: Places a purple line segment connecting (189, 202) to (444, 86).
; PLAN: r0=189(x1), r1=202(y1), r2=444(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 202
LDI r2, 444
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
