; DESCRIPTION: Draws a yellow line from (246, 9) to (139, 38).
; PLAN: r0=246(x1), r1=9(y1), r2=139(x2), r3=38(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 9
LDI r2, 139
LDI r3, 38
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
