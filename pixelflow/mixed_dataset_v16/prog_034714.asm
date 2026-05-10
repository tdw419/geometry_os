; DESCRIPTION: Renders a red line segment connecting (269, 136) to (114, 42).
; PLAN: r0=269(x1), r1=136(y1), r2=114(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 136
LDI r2, 114
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
