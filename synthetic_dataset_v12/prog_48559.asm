; DESCRIPTION: Renders a red line between points (222, 175) and (280, 124).
; PLAN: r0=222(x1), r1=175(y1), r2=280(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 175
LDI r2, 280
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
