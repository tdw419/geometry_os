; DESCRIPTION: Places a yellow line segment connecting (251, 253) to (250, 82).
; PLAN: r0=251(x1), r1=253(y1), r2=250(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 253
LDI r2, 250
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
