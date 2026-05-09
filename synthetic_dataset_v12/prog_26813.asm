; DESCRIPTION: Renders a white line between points (439, 47) and (477, 144).
; PLAN: r0=439(x1), r1=47(y1), r2=477(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 47
LDI r2, 477
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
