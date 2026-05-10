; DESCRIPTION: Draws a blue line from (478, 29) to (450, 9).
; PLAN: r0=478(x1), r1=29(y1), r2=450(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 29
LDI r2, 450
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
