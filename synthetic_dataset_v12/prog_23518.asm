; DESCRIPTION: Renders a blue line between points (496, 32) and (91, 172).
; PLAN: r0=496(x1), r1=32(y1), r2=91(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 32
LDI r2, 91
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
