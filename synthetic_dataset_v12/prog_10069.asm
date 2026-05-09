; DESCRIPTION: Renders a white line between points (472, 163) and (200, 90).
; PLAN: r0=472(x1), r1=163(y1), r2=200(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 163
LDI r2, 200
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
