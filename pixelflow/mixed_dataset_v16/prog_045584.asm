; DESCRIPTION: Renders a red line between points (15, 47) and (157, 29).
; PLAN: r0=15(x1), r1=47(y1), r2=157(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 47
LDI r2, 157
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
