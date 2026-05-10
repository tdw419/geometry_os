; DESCRIPTION: Draws a blue line from (306, 129) to (377, 4).
; PLAN: r0=306(x1), r1=129(y1), r2=377(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 129
LDI r2, 377
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
