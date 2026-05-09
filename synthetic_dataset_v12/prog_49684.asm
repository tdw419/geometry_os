; DESCRIPTION: Draws a purple line from (164, 254) to (382, 4).
; PLAN: r0=164(x1), r1=254(y1), r2=382(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 254
LDI r2, 382
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
