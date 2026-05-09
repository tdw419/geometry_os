; DESCRIPTION: Places a white line segment connecting (63, 253) to (17, 194).
; PLAN: r0=63(x1), r1=253(y1), r2=17(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 253
LDI r2, 17
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
