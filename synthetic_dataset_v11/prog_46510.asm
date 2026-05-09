; DESCRIPTION: Renders a purple line between points (72, 248) and (27, 247).
; PLAN: r0=72(x1), r1=248(y1), r2=27(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 248
LDI r2, 27
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
