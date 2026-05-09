; DESCRIPTION: Renders a white line between points (62, 174) and (506, 5).
; PLAN: r0=62(x1), r1=174(y1), r2=506(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 174
LDI r2, 506
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
