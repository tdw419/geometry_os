; DESCRIPTION: Renders a black line between points (255, 79) and (179, 130).
; PLAN: r0=255(x1), r1=79(y1), r2=179(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 79
LDI r2, 179
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
