; DESCRIPTION: Draws a purple line from (378, 27) to (21, 216).
; PLAN: r0=378(x1), r1=27(y1), r2=21(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 27
LDI r2, 21
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
