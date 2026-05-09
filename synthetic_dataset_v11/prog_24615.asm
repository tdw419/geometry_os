; DESCRIPTION: Draws a green line from (116, 101) to (36, 240).
; PLAN: r0=116(x1), r1=101(y1), r2=36(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 101
LDI r2, 36
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
