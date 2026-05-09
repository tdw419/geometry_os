; DESCRIPTION: Renders a red line between points (454, 57) and (309, 191).
; PLAN: r0=454(x1), r1=57(y1), r2=309(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 57
LDI r2, 309
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
