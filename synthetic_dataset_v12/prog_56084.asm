; DESCRIPTION: Renders a red line between points (507, 57) and (347, 109).
; PLAN: r0=507(x1), r1=57(y1), r2=347(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 57
LDI r2, 347
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
