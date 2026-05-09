; DESCRIPTION: Draws a yellow line from (183, 208) to (190, 96).
; PLAN: r0=183(x1), r1=208(y1), r2=190(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 208
LDI r2, 190
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
