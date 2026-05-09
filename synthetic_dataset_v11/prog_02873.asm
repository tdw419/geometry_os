; DESCRIPTION: Places a black line segment connecting (60, 225) to (125, 123).
; PLAN: r0=60(x1), r1=225(y1), r2=125(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 225
LDI r2, 125
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
