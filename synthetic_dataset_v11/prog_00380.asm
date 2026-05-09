; DESCRIPTION: Renders a red line between points (120, 86) and (253, 103).
; PLAN: r0=120(x1), r1=86(y1), r2=253(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 86
LDI r2, 253
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
