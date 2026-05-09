; DESCRIPTION: Draws a red line from (356, 182) to (307, 9).
; PLAN: r0=356(x1), r1=182(y1), r2=307(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 182
LDI r2, 307
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
