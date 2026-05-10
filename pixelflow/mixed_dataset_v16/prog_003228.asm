; DESCRIPTION: Draws a red line from (136, 4) to (26, 198).
; PLAN: r0=136(x1), r1=4(y1), r2=26(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 4
LDI r2, 26
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
