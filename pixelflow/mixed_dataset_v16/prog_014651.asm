; DESCRIPTION: Renders a purple line between points (263, 210) and (194, 92).
; PLAN: r0=263(x1), r1=210(y1), r2=194(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 210
LDI r2, 194
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
