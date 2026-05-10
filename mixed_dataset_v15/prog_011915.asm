; DESCRIPTION: Places a yellow line segment connecting (166, 193) to (253, 7).
; PLAN: r0=166(x1), r1=193(y1), r2=253(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 193
LDI r2, 253
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
