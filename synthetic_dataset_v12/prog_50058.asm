; DESCRIPTION: Draws a red line from (468, 64) to (490, 12).
; PLAN: r0=468(x1), r1=64(y1), r2=490(x2), r3=12(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 64
LDI r2, 490
LDI r3, 12
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
