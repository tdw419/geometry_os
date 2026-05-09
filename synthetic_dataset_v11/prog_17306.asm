; DESCRIPTION: Draws a yellow line from (246, 21) to (17, 55).
; PLAN: r0=246(x1), r1=21(y1), r2=17(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 21
LDI r2, 17
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
