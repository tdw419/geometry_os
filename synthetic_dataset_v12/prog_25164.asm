; DESCRIPTION: Renders a red line between points (152, 183) and (268, 96).
; PLAN: r0=152(x1), r1=183(y1), r2=268(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 183
LDI r2, 268
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
