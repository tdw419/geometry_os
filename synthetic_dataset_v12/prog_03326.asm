; DESCRIPTION: Draws a red line from (64, 245) to (428, 190).
; PLAN: r0=64(x1), r1=245(y1), r2=428(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 245
LDI r2, 428
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
