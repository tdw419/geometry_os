; DESCRIPTION: Places a red line segment connecting (303, 244) to (459, 91).
; PLAN: r0=303(x1), r1=244(y1), r2=459(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 244
LDI r2, 459
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
