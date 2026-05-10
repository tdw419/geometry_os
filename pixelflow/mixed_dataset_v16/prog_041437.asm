; DESCRIPTION: Places a blue line segment connecting (339, 222) to (402, 86).
; PLAN: r0=339(x1), r1=222(y1), r2=402(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 222
LDI r2, 402
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
