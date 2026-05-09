; DESCRIPTION: Renders a black line between points (12, 255) and (293, 49).
; PLAN: r0=12(x1), r1=255(y1), r2=293(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 255
LDI r2, 293
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
