; DESCRIPTION: Renders a red line between points (238, 47) and (290, 23).
; PLAN: r0=238(x1), r1=47(y1), r2=290(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 47
LDI r2, 290
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
