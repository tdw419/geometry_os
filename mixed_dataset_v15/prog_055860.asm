; DESCRIPTION: Draws a red line from (92, 36) to (66, 190).
; PLAN: r0=92(x1), r1=36(y1), r2=66(x2), r3=190(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 36
LDI r2, 66
LDI r3, 190
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
