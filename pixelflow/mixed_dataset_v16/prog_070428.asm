; DESCRIPTION: Renders a purple line between points (290, 238) and (334, 222).
; PLAN: r0=290(x1), r1=238(y1), r2=334(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 238
LDI r2, 334
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
