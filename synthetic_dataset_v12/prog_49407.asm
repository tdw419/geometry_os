; DESCRIPTION: Draws a purple line from (290, 27) to (441, 151).
; PLAN: r0=290(x1), r1=27(y1), r2=441(x2), r3=151(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 27
LDI r2, 441
LDI r3, 151
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
