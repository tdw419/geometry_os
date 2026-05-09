; DESCRIPTION: Places a yellow line segment connecting (59, 2) to (57, 75).
; PLAN: r0=59(x1), r1=2(y1), r2=57(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 2
LDI r2, 57
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
