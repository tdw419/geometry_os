; DESCRIPTION: Draws a yellow line from (246, 55) to (374, 25).
; PLAN: r0=246(x1), r1=55(y1), r2=374(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 55
LDI r2, 374
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
