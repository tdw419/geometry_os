; DESCRIPTION: Places a blue line segment connecting (149, 222) to (372, 27).
; PLAN: r0=149(x1), r1=222(y1), r2=372(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 222
LDI r2, 372
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
