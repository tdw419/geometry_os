; DESCRIPTION: Renders a white line between points (463, 148) and (495, 81).
; PLAN: r0=463(x1), r1=148(y1), r2=495(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 148
LDI r2, 495
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
