; DESCRIPTION: Places a red line segment connecting (77, 167) to (13, 200).
; PLAN: r0=77(x1), r1=167(y1), r2=13(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 167
LDI r2, 13
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
