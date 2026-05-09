; DESCRIPTION: Draws a yellow line from (246, 252) to (209, 62).
; PLAN: r0=246(x1), r1=252(y1), r2=209(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 252
LDI r2, 209
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
