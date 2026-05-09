; DESCRIPTION: Draws a purple line from (135, 95) to (458, 101).
; PLAN: r0=135(x1), r1=95(y1), r2=458(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 95
LDI r2, 458
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
