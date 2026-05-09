; DESCRIPTION: Renders a red line between points (306, 58) and (372, 223).
; PLAN: r0=306(x1), r1=58(y1), r2=372(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 58
LDI r2, 372
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
