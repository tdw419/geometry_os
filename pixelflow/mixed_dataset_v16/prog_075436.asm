; DESCRIPTION: Renders a red line between points (486, 148) and (486, 202).
; PLAN: r0=486(x1), r1=148(y1), r2=486(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 148
LDI r2, 486
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
