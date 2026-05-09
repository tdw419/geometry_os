; DESCRIPTION: Renders a red line between points (20, 135) and (186, 220).
; PLAN: r0=20(x1), r1=135(y1), r2=186(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 135
LDI r2, 186
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
