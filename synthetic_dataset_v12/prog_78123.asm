; DESCRIPTION: Draws a blue line from (399, 43) to (302, 193).
; PLAN: r0=399(x1), r1=43(y1), r2=302(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 43
LDI r2, 302
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
