; DESCRIPTION: Places a red line segment connecting (172, 52) to (253, 30).
; PLAN: r0=172(x1), r1=52(y1), r2=253(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 52
LDI r2, 253
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
