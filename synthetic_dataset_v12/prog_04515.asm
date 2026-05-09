; DESCRIPTION: Draws a yellow line from (466, 184) to (0, 246).
; PLAN: r0=466(x1), r1=184(y1), r2=0(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 184
LDI r2, 0
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
