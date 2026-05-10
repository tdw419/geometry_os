; DESCRIPTION: Draws a blue line from (450, 41) to (337, 17).
; PLAN: r0=450(x1), r1=41(y1), r2=337(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 41
LDI r2, 337
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
