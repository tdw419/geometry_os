; DESCRIPTION: Places a magenta line segment connecting (274, 253) to (454, 96).
; PLAN: r0=274(x1), r1=253(y1), r2=454(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 253
LDI r2, 454
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
