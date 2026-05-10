; DESCRIPTION: Renders a white line between points (185, 247) and (336, 145).
; PLAN: r0=185(x1), r1=247(y1), r2=336(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 247
LDI r2, 336
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
