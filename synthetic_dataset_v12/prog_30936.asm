; DESCRIPTION: Places a yellow line segment connecting (174, 248) to (334, 1).
; PLAN: r0=174(x1), r1=248(y1), r2=334(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 248
LDI r2, 334
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
