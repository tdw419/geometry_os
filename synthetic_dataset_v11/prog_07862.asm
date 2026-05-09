; DESCRIPTION: Places a purple line segment connecting (204, 13) to (66, 213).
; PLAN: r0=204(x1), r1=13(y1), r2=66(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 13
LDI r2, 66
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
