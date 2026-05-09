; DESCRIPTION: Renders a red line between points (34, 69) and (164, 155).
; PLAN: r0=34(x1), r1=69(y1), r2=164(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 69
LDI r2, 164
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
