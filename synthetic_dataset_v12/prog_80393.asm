; DESCRIPTION: Renders a white line between points (454, 193) and (286, 85).
; PLAN: r0=454(x1), r1=193(y1), r2=286(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 193
LDI r2, 286
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
