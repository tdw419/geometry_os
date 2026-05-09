; DESCRIPTION: Places a red line segment connecting (469, 226) to (360, 199).
; PLAN: r0=469(x1), r1=226(y1), r2=360(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 226
LDI r2, 360
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
