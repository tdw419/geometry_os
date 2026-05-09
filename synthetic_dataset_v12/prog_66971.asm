; DESCRIPTION: Renders a black line between points (474, 30) and (321, 69).
; PLAN: r0=474(x1), r1=30(y1), r2=321(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 30
LDI r2, 321
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
