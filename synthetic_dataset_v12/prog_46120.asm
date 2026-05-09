; DESCRIPTION: Renders a blue line between points (24, 253) and (335, 149).
; PLAN: r0=24(x1), r1=253(y1), r2=335(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 253
LDI r2, 335
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
