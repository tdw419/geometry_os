; DESCRIPTION: Renders a black line between points (83, 60) and (19, 69).
; PLAN: r0=83(x1), r1=60(y1), r2=19(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 60
LDI r2, 19
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
