; DESCRIPTION: Renders a red line between points (216, 124) and (36, 124).
; PLAN: r0=216(x1), r1=124(y1), r2=36(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 124
LDI r2, 36
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
