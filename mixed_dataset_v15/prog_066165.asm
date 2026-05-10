; DESCRIPTION: Renders a red line between points (478, 166) and (509, 83).
; PLAN: r0=478(x1), r1=166(y1), r2=509(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 166
LDI r2, 509
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
