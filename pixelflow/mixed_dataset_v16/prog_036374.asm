; DESCRIPTION: Renders a purple line between points (428, 130) and (335, 249).
; PLAN: r0=428(x1), r1=130(y1), r2=335(x2), r3=249(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 130
LDI r2, 335
LDI r3, 249
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
