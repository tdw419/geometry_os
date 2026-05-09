; DESCRIPTION: Renders a red line between points (7, 113) and (345, 37).
; PLAN: r0=7(x1), r1=113(y1), r2=345(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 113
LDI r2, 345
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
