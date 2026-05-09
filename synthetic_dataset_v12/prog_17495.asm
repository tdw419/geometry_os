; DESCRIPTION: Draws a yellow line from (136, 151) to (466, 198).
; PLAN: r0=136(x1), r1=151(y1), r2=466(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 151
LDI r2, 466
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
