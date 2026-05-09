; DESCRIPTION: Places a blue line segment connecting (51, 9) to (338, 222).
; PLAN: r0=51(x1), r1=9(y1), r2=338(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 9
LDI r2, 338
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
