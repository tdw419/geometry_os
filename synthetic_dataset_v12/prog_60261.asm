; DESCRIPTION: Renders a red line between points (354, 123) and (439, 142).
; PLAN: r0=354(x1), r1=123(y1), r2=439(x2), r3=142(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 123
LDI r2, 439
LDI r3, 142
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
