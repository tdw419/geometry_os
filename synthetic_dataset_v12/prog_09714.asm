; DESCRIPTION: Renders a red line between points (418, 125) and (184, 91).
; PLAN: r0=418(x1), r1=125(y1), r2=184(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 125
LDI r2, 184
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
