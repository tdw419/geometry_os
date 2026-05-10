; DESCRIPTION: Renders a red line between points (435, 18) and (87, 20).
; PLAN: r0=435(x1), r1=18(y1), r2=87(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 18
LDI r2, 87
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
