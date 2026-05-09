; DESCRIPTION: Renders a red line between points (360, 252) and (206, 122).
; PLAN: r0=360(x1), r1=252(y1), r2=206(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 252
LDI r2, 206
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
