; DESCRIPTION: Renders a black line between points (143, 32) and (157, 211).
; PLAN: r0=143(x1), r1=32(y1), r2=157(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 32
LDI r2, 157
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
