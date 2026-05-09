; DESCRIPTION: Renders a red line between points (20, 220) and (220, 206).
; PLAN: r0=20(x1), r1=220(y1), r2=220(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 220
LDI r2, 220
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
