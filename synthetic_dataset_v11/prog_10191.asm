; DESCRIPTION: Renders a purple line between points (102, 226) and (190, 166).
; PLAN: r0=102(x1), r1=226(y1), r2=190(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 226
LDI r2, 190
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
