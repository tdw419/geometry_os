; DESCRIPTION: Renders a purple line between points (173, 148) and (142, 216).
; PLAN: r0=173(x1), r1=148(y1), r2=142(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 148
LDI r2, 142
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
