; DESCRIPTION: Places a black line segment connecting (181, 253) to (310, 75).
; PLAN: r0=181(x1), r1=253(y1), r2=310(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 253
LDI r2, 310
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
