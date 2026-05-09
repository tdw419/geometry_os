; DESCRIPTION: Renders a purple line between points (11, 207) and (495, 149).
; PLAN: r0=11(x1), r1=207(y1), r2=495(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 207
LDI r2, 495
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
