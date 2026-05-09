; DESCRIPTION: Draws a yellow line from (37, 40) to (246, 38).
; PLAN: r0=37(x1), r1=40(y1), r2=246(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 40
LDI r2, 246
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
