; DESCRIPTION: Places a black line segment connecting (32, 112) to (8, 240).
; PLAN: r0=32(x1), r1=112(y1), r2=8(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 112
LDI r2, 8
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
