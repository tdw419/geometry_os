; DESCRIPTION: Draws a purple line from (379, 15) to (251, 57).
; PLAN: r0=379(x1), r1=15(y1), r2=251(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 15
LDI r2, 251
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
