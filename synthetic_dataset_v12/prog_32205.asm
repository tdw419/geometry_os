; DESCRIPTION: Renders a green line between points (165, 174) and (376, 145).
; PLAN: r0=165(x1), r1=174(y1), r2=376(x2), r3=145(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 174
LDI r2, 376
LDI r3, 145
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
