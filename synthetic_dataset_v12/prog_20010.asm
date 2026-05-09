; DESCRIPTION: Renders a black line between points (351, 28) and (292, 82).
; PLAN: r0=351(x1), r1=28(y1), r2=292(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 28
LDI r2, 292
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
