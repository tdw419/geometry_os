; DESCRIPTION: Draws a blue line from (106, 55) to (306, 35).
; PLAN: r0=106(x1), r1=55(y1), r2=306(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 55
LDI r2, 306
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
