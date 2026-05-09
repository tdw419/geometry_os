; DESCRIPTION: Renders a black line between points (90, 189) and (148, 224).
; PLAN: r0=90(x1), r1=189(y1), r2=148(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 189
LDI r2, 148
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
