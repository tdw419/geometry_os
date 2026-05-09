; DESCRIPTION: Renders a white line between points (118, 173) and (119, 247).
; PLAN: r0=118(x1), r1=173(y1), r2=119(x2), r3=247(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 173
LDI r2, 119
LDI r3, 247
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
