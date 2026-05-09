; DESCRIPTION: Draws a red line from (192, 118) to (460, 49).
; PLAN: r0=192(x1), r1=118(y1), r2=460(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 118
LDI r2, 460
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
