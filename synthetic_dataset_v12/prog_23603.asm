; DESCRIPTION: Renders a red line between points (335, 193) and (180, 15).
; PLAN: r0=335(x1), r1=193(y1), r2=180(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 193
LDI r2, 180
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
