; DESCRIPTION: Draws a blue line from (143, 60) to (399, 217).
; PLAN: r0=143(x1), r1=60(y1), r2=399(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 60
LDI r2, 399
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
