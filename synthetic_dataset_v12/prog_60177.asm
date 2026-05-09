; DESCRIPTION: Renders a red line between points (25, 213) and (95, 122).
; PLAN: r0=25(x1), r1=213(y1), r2=95(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 213
LDI r2, 95
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
