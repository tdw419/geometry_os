; DESCRIPTION: Draws a purple line from (146, 90) to (286, 73).
; PLAN: r0=146(x1), r1=90(y1), r2=286(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 90
LDI r2, 286
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
