; DESCRIPTION: Renders a black line between points (33, 224) and (313, 245).
; PLAN: r0=33(x1), r1=224(y1), r2=313(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 224
LDI r2, 313
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
