; DESCRIPTION: Places a green line segment connecting (25, 218) to (233, 39).
; PLAN: r0=25(x1), r1=218(y1), r2=233(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 218
LDI r2, 233
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
