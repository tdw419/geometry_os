; DESCRIPTION: Renders a white line between points (285, 87) and (62, 106).
; PLAN: r0=285(x1), r1=87(y1), r2=62(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 87
LDI r2, 62
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
