; DESCRIPTION: Renders a white line between points (109, 142) and (495, 157).
; PLAN: r0=109(x1), r1=142(y1), r2=495(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 142
LDI r2, 495
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
