; DESCRIPTION: Draws a yellow line from (157, 77) to (49, 115).
; PLAN: r0=157(x1), r1=77(y1), r2=49(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 77
LDI r2, 49
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
