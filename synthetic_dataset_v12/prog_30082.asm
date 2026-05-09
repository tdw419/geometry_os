; DESCRIPTION: Draws a orange line from (380, 190) to (4, 153).
; PLAN: r0=380(x1), r1=190(y1), r2=4(x2), r3=153(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 190
LDI r2, 4
LDI r3, 153
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
