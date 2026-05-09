; DESCRIPTION: Renders a red line between points (199, 175) and (78, 146).
; PLAN: r0=199(x1), r1=175(y1), r2=78(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 175
LDI r2, 78
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
