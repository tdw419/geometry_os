; DESCRIPTION: Places a black line segment connecting (32, 223) to (240, 181).
; PLAN: r0=32(x1), r1=223(y1), r2=240(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 223
LDI r2, 240
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
