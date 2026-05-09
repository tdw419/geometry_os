; DESCRIPTION: Draws a yellow line from (35, 203) to (139, 26).
; PLAN: r0=35(x1), r1=203(y1), r2=139(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 203
LDI r2, 139
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
