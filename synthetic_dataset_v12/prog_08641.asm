; DESCRIPTION: Places a magenta line segment connecting (419, 105) to (157, 253).
; PLAN: r0=419(x1), r1=105(y1), r2=157(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 105
LDI r2, 157
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
