; DESCRIPTION: Places a blue line segment connecting (347, 182) to (59, 18).
; PLAN: r0=347(x1), r1=182(y1), r2=59(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 182
LDI r2, 59
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
