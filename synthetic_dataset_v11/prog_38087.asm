; DESCRIPTION: Renders a red line between points (124, 126) and (57, 165).
; PLAN: r0=124(x1), r1=126(y1), r2=57(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 126
LDI r2, 57
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
