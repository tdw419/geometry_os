; DESCRIPTION: Renders a red line between points (124, 170) and (205, 92).
; PLAN: r0=124(x1), r1=170(y1), r2=205(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 170
LDI r2, 205
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
