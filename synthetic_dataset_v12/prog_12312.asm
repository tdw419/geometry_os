; DESCRIPTION: Draws a blue line from (172, 150) to (496, 89).
; PLAN: r0=172(x1), r1=150(y1), r2=496(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 150
LDI r2, 496
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
