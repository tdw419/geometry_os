; DESCRIPTION: Places a red line segment connecting (204, 91) to (105, 240).
; PLAN: r0=204(x1), r1=91(y1), r2=105(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 91
LDI r2, 105
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
