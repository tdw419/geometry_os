; DESCRIPTION: Renders a purple line between points (173, 225) and (23, 77).
; PLAN: r0=173(x1), r1=225(y1), r2=23(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 225
LDI r2, 23
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
