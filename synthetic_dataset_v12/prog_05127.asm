; DESCRIPTION: Places a purple line segment connecting (462, 59) to (490, 239).
; PLAN: r0=462(x1), r1=59(y1), r2=490(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 59
LDI r2, 490
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
