; DESCRIPTION: Places a black line segment connecting (98, 253) to (188, 102).
; PLAN: r0=98(x1), r1=253(y1), r2=188(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 253
LDI r2, 188
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
