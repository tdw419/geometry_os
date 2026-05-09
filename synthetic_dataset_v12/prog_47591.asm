; DESCRIPTION: Draws a purple line from (79, 98) to (360, 227).
; PLAN: r0=79(x1), r1=98(y1), r2=360(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 98
LDI r2, 360
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
