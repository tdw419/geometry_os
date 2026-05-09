; DESCRIPTION: Draws a red line from (172, 124) to (163, 109).
; PLAN: r0=172(x1), r1=124(y1), r2=163(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 124
LDI r2, 163
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
