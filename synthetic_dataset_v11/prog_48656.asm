; DESCRIPTION: Renders a red line between points (189, 57) and (238, 103).
; PLAN: r0=189(x1), r1=57(y1), r2=238(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 57
LDI r2, 238
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
