; DESCRIPTION: Draws a purple line from (221, 134) to (140, 64).
; PLAN: r0=221(x1), r1=134(y1), r2=140(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 134
LDI r2, 140
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
