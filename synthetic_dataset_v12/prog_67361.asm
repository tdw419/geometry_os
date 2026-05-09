; DESCRIPTION: Draws a black line from (414, 1) to (142, 40).
; PLAN: r0=414(x1), r1=1(y1), r2=142(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 1
LDI r2, 142
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
