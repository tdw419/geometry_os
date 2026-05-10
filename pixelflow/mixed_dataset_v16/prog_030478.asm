; DESCRIPTION: Places a blue line segment connecting (172, 105) to (275, 253).
; PLAN: r0=172(x1), r1=105(y1), r2=275(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 105
LDI r2, 275
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
