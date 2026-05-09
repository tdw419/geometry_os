; DESCRIPTION: Places a blue line segment connecting (290, 22) to (491, 239).
; PLAN: r0=290(x1), r1=22(y1), r2=491(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 22
LDI r2, 491
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
