; DESCRIPTION: Draws a blue line from (375, 250) to (120, 43).
; PLAN: r0=375(x1), r1=250(y1), r2=120(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 250
LDI r2, 120
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
