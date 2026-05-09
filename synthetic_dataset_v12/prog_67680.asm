; DESCRIPTION: Places a black line segment connecting (64, 254) to (279, 129).
; PLAN: r0=64(x1), r1=254(y1), r2=279(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 254
LDI r2, 279
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
