; DESCRIPTION: Draws a green line from (179, 112) to (40, 190).
; PLAN: r0=179(x1), r1=112(y1), r2=40(x2), r3=190(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 112
LDI r2, 40
LDI r3, 190
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
