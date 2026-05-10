; DESCRIPTION: Places a green line segment connecting (315, 56) to (264, 77).
; PLAN: r0=315(x1), r1=56(y1), r2=264(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 56
LDI r2, 264
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
