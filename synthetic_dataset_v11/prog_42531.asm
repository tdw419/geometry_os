; DESCRIPTION: Renders a purple line between points (21, 180) and (7, 59).
; PLAN: r0=21(x1), r1=180(y1), r2=7(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 180
LDI r2, 7
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
