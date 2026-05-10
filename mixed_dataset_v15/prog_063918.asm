; DESCRIPTION: Places a red line segment connecting (128, 31) to (369, 142).
; PLAN: r0=128(x1), r1=31(y1), r2=369(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 31
LDI r2, 369
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
