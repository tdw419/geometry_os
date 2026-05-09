; DESCRIPTION: Renders a purple line between points (7, 135) and (413, 178).
; PLAN: r0=7(x1), r1=135(y1), r2=413(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 135
LDI r2, 413
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
