; DESCRIPTION: Renders a white line between points (109, 109) and (269, 81).
; PLAN: r0=109(x1), r1=109(y1), r2=269(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 109
LDI r2, 269
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
