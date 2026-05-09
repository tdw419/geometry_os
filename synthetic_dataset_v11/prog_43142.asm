; DESCRIPTION: Draws a purple line from (21, 188) to (143, 115).
; PLAN: r0=21(x1), r1=188(y1), r2=143(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 188
LDI r2, 143
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
