; DESCRIPTION: Draws a purple line from (172, 206) to (66, 35).
; PLAN: r0=172(x1), r1=206(y1), r2=66(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 206
LDI r2, 66
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
