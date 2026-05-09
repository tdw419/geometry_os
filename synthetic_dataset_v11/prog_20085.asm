; DESCRIPTION: Places a yellow line segment connecting (178, 253) to (112, 237).
; PLAN: r0=178(x1), r1=253(y1), r2=112(x2), r3=237(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 253
LDI r2, 112
LDI r3, 237
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
