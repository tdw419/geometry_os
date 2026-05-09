; DESCRIPTION: Draws a yellow line from (84, 69) to (116, 54).
; PLAN: r0=84(x1), r1=69(y1), r2=116(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 69
LDI r2, 116
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
