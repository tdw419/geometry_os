; DESCRIPTION: Places a purple line segment connecting (109, 195) to (236, 13).
; PLAN: r0=109(x1), r1=195(y1), r2=236(x2), r3=13(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 195
LDI r2, 236
LDI r3, 13
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
