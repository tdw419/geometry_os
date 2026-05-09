; DESCRIPTION: Renders a white line between points (253, 148) and (103, 95).
; PLAN: r0=253(x1), r1=148(y1), r2=103(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 148
LDI r2, 103
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
