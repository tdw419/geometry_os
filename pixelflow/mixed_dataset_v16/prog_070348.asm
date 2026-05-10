; DESCRIPTION: Renders a white line segment connecting (60, 81) to (157, 148).
; PLAN: r0=60(x1), r1=81(y1), r2=157(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 81
LDI r2, 157
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
