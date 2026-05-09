; DESCRIPTION: Renders a red line between points (253, 54) and (400, 24).
; PLAN: r0=253(x1), r1=54(y1), r2=400(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 54
LDI r2, 400
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
