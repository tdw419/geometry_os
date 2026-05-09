; DESCRIPTION: Renders a red line between points (29, 243) and (12, 55).
; PLAN: r0=29(x1), r1=243(y1), r2=12(x2), r3=55(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 243
LDI r2, 12
LDI r3, 55
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
