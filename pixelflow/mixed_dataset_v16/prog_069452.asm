; DESCRIPTION: Draws a purple line from (349, 82) to (6, 175).
; PLAN: r0=349(x1), r1=82(y1), r2=6(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 82
LDI r2, 6
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
