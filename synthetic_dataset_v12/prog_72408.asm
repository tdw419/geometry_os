; DESCRIPTION: Renders a red line between points (331, 75) and (476, 60).
; PLAN: r0=331(x1), r1=75(y1), r2=476(x2), r3=60(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 75
LDI r2, 476
LDI r3, 60
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
