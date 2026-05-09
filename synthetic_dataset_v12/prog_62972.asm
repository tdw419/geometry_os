; DESCRIPTION: Renders a black line between points (76, 45) and (128, 255).
; PLAN: r0=76(x1), r1=45(y1), r2=128(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 45
LDI r2, 128
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
