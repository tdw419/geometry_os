; DESCRIPTION: Draws a blue line from (36, 122) to (50, 153).
; PLAN: r0=36(x1), r1=122(y1), r2=50(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 122
LDI r2, 50
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
