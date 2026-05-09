; DESCRIPTION: Renders a red line between points (390, 85) and (295, 98).
; PLAN: r0=390(x1), r1=85(y1), r2=295(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 85
LDI r2, 295
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
