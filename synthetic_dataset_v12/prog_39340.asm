; DESCRIPTION: Renders a white line between points (311, 155) and (264, 55).
; PLAN: r0=311(x1), r1=155(y1), r2=264(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 155
LDI r2, 264
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
