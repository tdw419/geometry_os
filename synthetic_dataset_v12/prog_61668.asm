; DESCRIPTION: Places a yellow line segment connecting (478, 253) to (223, 21).
; PLAN: r0=478(x1), r1=253(y1), r2=223(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 253
LDI r2, 223
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
