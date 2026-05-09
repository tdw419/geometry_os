; DESCRIPTION: Places a yellow line segment connecting (476, 253) to (373, 171).
; PLAN: r0=476(x1), r1=253(y1), r2=373(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 253
LDI r2, 373
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
