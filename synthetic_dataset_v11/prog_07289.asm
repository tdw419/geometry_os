; DESCRIPTION: Draws a yellow line from (135, 94) to (116, 17).
; PLAN: r0=135(x1), r1=94(y1), r2=116(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 94
LDI r2, 116
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
