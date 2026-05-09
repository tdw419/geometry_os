; DESCRIPTION: Renders a white line between points (66, 121) and (142, 245).
; PLAN: r0=66(x1), r1=121(y1), r2=142(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 121
LDI r2, 142
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
