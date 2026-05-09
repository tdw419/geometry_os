; DESCRIPTION: Renders a yellow line between points (185, 87) and (335, 174).
; PLAN: r0=185(x1), r1=87(y1), r2=335(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 87
LDI r2, 335
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
