; DESCRIPTION: Renders a black line between points (48, 107) and (222, 245).
; PLAN: r0=48(x1), r1=107(y1), r2=222(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 107
LDI r2, 222
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
