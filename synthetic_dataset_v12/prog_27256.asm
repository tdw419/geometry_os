; DESCRIPTION: Draws a purple line from (343, 224) to (410, 78).
; PLAN: r0=343(x1), r1=224(y1), r2=410(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 224
LDI r2, 410
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
