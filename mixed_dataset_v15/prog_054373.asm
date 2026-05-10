; DESCRIPTION: Draws a purple line from (180, 26) to (104, 172).
; PLAN: r0=180(x1), r1=26(y1), r2=104(x2), r3=172(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 26
LDI r2, 104
LDI r3, 172
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
