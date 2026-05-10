; DESCRIPTION: Draws a purple line from (269, 197) to (505, 31).
; PLAN: r0=269(x1), r1=197(y1), r2=505(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 197
LDI r2, 505
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
