; DESCRIPTION: Places a green line segment connecting (424, 138) to (110, 155).
; PLAN: r0=424(x1), r1=138(y1), r2=110(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 138
LDI r2, 110
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
