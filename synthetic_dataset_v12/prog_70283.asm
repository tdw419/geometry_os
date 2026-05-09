; DESCRIPTION: Draws a green line from (297, 1) to (426, 97).
; PLAN: r0=297(x1), r1=1(y1), r2=426(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 1
LDI r2, 426
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
