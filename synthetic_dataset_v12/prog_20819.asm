; DESCRIPTION: Draws a yellow line from (423, 31) to (233, 246).
; PLAN: r0=423(x1), r1=31(y1), r2=233(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 31
LDI r2, 233
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
