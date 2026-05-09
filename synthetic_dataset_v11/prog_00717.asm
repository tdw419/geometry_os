; DESCRIPTION: Places a red line segment connecting (137, 171) to (248, 40).
; PLAN: r0=137(x1), r1=171(y1), r2=248(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 171
LDI r2, 248
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
