; DESCRIPTION: Renders a red line between points (118, 84) and (465, 6).
; PLAN: r0=118(x1), r1=84(y1), r2=465(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 84
LDI r2, 465
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
