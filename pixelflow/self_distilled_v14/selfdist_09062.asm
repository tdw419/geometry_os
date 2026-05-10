; DESCRIPTION: Renders a white line segment connecting (219, 46) to (101, 137).
; PLAN: r0=219(x1), r1=46(y1), r2=101(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 46
LDI r2, 101
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
