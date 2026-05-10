; DESCRIPTION: Renders a purple line between points (120, 55) and (276, 50).
; PLAN: r0=120(x1), r1=55(y1), r2=276(x2), r3=50(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 55
LDI r2, 276
LDI r3, 50
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
