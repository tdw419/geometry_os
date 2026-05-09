; DESCRIPTION: Draws a blue line from (205, 77) to (107, 190).
; PLAN: r0=205(x1), r1=77(y1), r2=107(x2), r3=190(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 77
LDI r2, 107
LDI r3, 190
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
