; DESCRIPTION: Renders a purple line between points (468, 87) and (247, 222).
; PLAN: r0=468(x1), r1=87(y1), r2=247(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 87
LDI r2, 247
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
