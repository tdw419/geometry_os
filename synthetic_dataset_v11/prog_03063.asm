; DESCRIPTION: Places a black line segment connecting (165, 253) to (100, 196).
; PLAN: r0=165(x1), r1=253(y1), r2=100(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 253
LDI r2, 100
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
