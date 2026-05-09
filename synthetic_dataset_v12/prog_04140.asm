; DESCRIPTION: Draws a blue line from (138, 43) to (12, 49).
; PLAN: r0=138(x1), r1=43(y1), r2=12(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 43
LDI r2, 12
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
