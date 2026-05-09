; DESCRIPTION: Places a blue line segment connecting (138, 165) to (312, 164).
; PLAN: r0=138(x1), r1=165(y1), r2=312(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 165
LDI r2, 312
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
