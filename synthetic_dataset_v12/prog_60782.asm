; DESCRIPTION: Draws a blue line from (496, 193) to (254, 11).
; PLAN: r0=496(x1), r1=193(y1), r2=254(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 193
LDI r2, 254
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
