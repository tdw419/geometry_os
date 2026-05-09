; DESCRIPTION: Renders a red line between points (31, 250) and (237, 184).
; PLAN: r0=31(x1), r1=250(y1), r2=237(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 250
LDI r2, 237
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
