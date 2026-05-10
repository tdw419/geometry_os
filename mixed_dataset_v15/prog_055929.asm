; DESCRIPTION: Places a black line segment connecting (0, 237) to (69, 227).
; PLAN: r0=0(x1), r1=237(y1), r2=69(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 237
LDI r2, 69
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
