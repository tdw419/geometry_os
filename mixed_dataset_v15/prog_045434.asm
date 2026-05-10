; DESCRIPTION: Draws a blue line from (488, 43) to (47, 149).
; PLAN: r0=488(x1), r1=43(y1), r2=47(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 43
LDI r2, 47
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
