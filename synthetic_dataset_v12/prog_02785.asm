; DESCRIPTION: Renders a red line between points (306, 148) and (489, 78).
; PLAN: r0=306(x1), r1=148(y1), r2=489(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 148
LDI r2, 489
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
