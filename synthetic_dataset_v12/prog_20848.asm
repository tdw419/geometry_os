; DESCRIPTION: Draws a purple line from (60, 3) to (61, 180).
; PLAN: r0=60(x1), r1=3(y1), r2=61(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 3
LDI r2, 61
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
