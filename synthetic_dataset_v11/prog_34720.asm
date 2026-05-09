; DESCRIPTION: Draws a green line from (118, 182) to (17, 77).
; PLAN: r0=118(x1), r1=182(y1), r2=17(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 182
LDI r2, 17
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
