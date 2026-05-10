; DESCRIPTION: Renders a purple line between points (280, 24) and (36, 209).
; PLAN: r0=280(x1), r1=24(y1), r2=36(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 24
LDI r2, 36
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
