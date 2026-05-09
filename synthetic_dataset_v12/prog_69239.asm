; DESCRIPTION: Renders a red line between points (39, 125) and (36, 14).
; PLAN: r0=39(x1), r1=125(y1), r2=36(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 125
LDI r2, 36
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
