; DESCRIPTION: Draws a blue line from (131, 43) to (234, 130).
; PLAN: r0=131(x1), r1=43(y1), r2=234(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 43
LDI r2, 234
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
