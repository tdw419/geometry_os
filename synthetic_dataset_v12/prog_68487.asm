; DESCRIPTION: Renders a red line between points (223, 113) and (396, 187).
; PLAN: r0=223(x1), r1=113(y1), r2=396(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 113
LDI r2, 396
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
