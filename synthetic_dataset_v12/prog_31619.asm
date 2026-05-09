; DESCRIPTION: Draws a purple line from (433, 142) to (338, 36).
; PLAN: r0=433(x1), r1=142(y1), r2=338(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 142
LDI r2, 338
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
