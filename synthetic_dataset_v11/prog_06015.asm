; DESCRIPTION: Draws a black line from (47, 22) to (190, 141).
; PLAN: r0=47(x1), r1=22(y1), r2=190(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 22
LDI r2, 190
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
