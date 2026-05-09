; DESCRIPTION: Renders a black line between points (163, 8) and (271, 148).
; PLAN: r0=163(x1), r1=8(y1), r2=271(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 8
LDI r2, 271
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
