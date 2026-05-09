; DESCRIPTION: Renders a red line between points (5, 47) and (16, 175).
; PLAN: r0=5(x1), r1=47(y1), r2=16(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 47
LDI r2, 16
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
