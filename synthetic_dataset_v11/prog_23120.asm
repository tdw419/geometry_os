; DESCRIPTION: Renders a red line between points (179, 46) and (218, 191).
; PLAN: r0=179(x1), r1=46(y1), r2=218(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 46
LDI r2, 218
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
