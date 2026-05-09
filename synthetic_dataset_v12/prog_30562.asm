; DESCRIPTION: Renders a white line between points (43, 0) and (81, 247).
; PLAN: r0=43(x1), r1=0(y1), r2=81(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 0
LDI r2, 81
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
