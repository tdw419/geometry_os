; DESCRIPTION: Places a red line segment connecting (142, 239) to (176, 245).
; PLAN: r0=142(x1), r1=239(y1), r2=176(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 239
LDI r2, 176
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
