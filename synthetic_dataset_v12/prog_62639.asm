; DESCRIPTION: Draws a green line from (19, 116) to (1, 190).
; PLAN: r0=19(x1), r1=116(y1), r2=1(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 116
LDI r2, 1
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
