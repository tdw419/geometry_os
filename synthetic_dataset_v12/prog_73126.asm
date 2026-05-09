; DESCRIPTION: Places a yellow line segment connecting (59, 43) to (508, 240).
; PLAN: r0=59(x1), r1=43(y1), r2=508(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 43
LDI r2, 508
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
