; DESCRIPTION: Renders a red line between points (199, 238) and (153, 4).
; PLAN: r0=199(x1), r1=238(y1), r2=153(x2), r3=4(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 238
LDI r2, 153
LDI r3, 4
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
