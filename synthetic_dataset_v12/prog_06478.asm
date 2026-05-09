; DESCRIPTION: Places a blue line segment connecting (380, 189) to (219, 72).
; PLAN: r0=380(x1), r1=189(y1), r2=219(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 189
LDI r2, 219
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
