; DESCRIPTION: Renders a red line between points (238, 38) and (13, 57).
; PLAN: r0=238(x1), r1=38(y1), r2=13(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 38
LDI r2, 13
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
