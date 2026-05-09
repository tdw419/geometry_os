; DESCRIPTION: Renders a white line between points (43, 193) and (337, 199).
; PLAN: r0=43(x1), r1=193(y1), r2=337(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 193
LDI r2, 337
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
