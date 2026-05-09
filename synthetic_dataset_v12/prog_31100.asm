; DESCRIPTION: Places a red line segment connecting (122, 144) to (274, 101).
; PLAN: r0=122(x1), r1=144(y1), r2=274(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 144
LDI r2, 274
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
