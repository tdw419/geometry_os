; DESCRIPTION: Draws a purple line from (439, 24) to (385, 233).
; PLAN: r0=439(x1), r1=24(y1), r2=385(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 24
LDI r2, 385
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
