; DESCRIPTION: Renders a purple line between points (415, 75) and (495, 227).
; PLAN: r0=415(x1), r1=75(y1), r2=495(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 75
LDI r2, 495
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
