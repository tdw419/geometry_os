; DESCRIPTION: Renders a black line between points (274, 105) and (480, 6).
; PLAN: r0=274(x1), r1=105(y1), r2=480(x2), r3=6(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 105
LDI r2, 480
LDI r3, 6
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
