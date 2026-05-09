; DESCRIPTION: Places a yellow line segment connecting (93, 68) to (253, 138).
; PLAN: r0=93(x1), r1=68(y1), r2=253(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 68
LDI r2, 253
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
