; DESCRIPTION: Draws a purple line from (66, 207) to (244, 90).
; PLAN: r0=66(x1), r1=207(y1), r2=244(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 207
LDI r2, 244
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
