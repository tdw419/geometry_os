; DESCRIPTION: Renders a purple line between points (96, 110) and (222, 27).
; PLAN: r0=96(x1), r1=110(y1), r2=222(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 110
LDI r2, 222
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
