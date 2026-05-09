; DESCRIPTION: Renders a orange line between points (308, 90) and (118, 255).
; PLAN: r0=308(x1), r1=90(y1), r2=118(x2), r3=255(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 90
LDI r2, 118
LDI r3, 255
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
