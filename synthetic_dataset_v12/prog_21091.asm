; DESCRIPTION: Renders a blue line between points (398, 183) and (335, 109).
; PLAN: r0=398(x1), r1=183(y1), r2=335(x2), r3=109(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 183
LDI r2, 335
LDI r3, 109
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
