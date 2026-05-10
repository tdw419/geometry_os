; DESCRIPTION: Places a blue line segment connecting (380, 2) to (424, 159).
; PLAN: r0=380(x1), r1=2(y1), r2=424(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 2
LDI r2, 424
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
