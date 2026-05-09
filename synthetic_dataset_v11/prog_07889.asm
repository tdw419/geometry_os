; DESCRIPTION: Draws a blue line from (71, 70) to (158, 172).
; PLAN: r0=71(x1), r1=70(y1), r2=158(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 70
LDI r2, 158
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
