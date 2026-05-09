; DESCRIPTION: Places a yellow line segment connecting (178, 77) to (4, 200).
; PLAN: r0=178(x1), r1=77(y1), r2=4(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 77
LDI r2, 4
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
