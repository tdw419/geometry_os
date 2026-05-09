; DESCRIPTION: Draws a purple line from (186, 104) to (16, 251).
; PLAN: r0=186(x1), r1=104(y1), r2=16(x2), r3=251(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 104
LDI r2, 16
LDI r3, 251
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
