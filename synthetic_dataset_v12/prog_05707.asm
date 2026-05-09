; DESCRIPTION: Places a blue line segment connecting (490, 28) to (298, 232).
; PLAN: r0=490(x1), r1=28(y1), r2=298(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 28
LDI r2, 298
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
