; DESCRIPTION: Draws a blue line from (140, 10) to (47, 61).
; PLAN: r0=140(x1), r1=10(y1), r2=47(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 10
LDI r2, 47
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
