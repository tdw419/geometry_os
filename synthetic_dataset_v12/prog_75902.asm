; DESCRIPTION: Draws a green line from (232, 116) to (156, 149).
; PLAN: r0=232(x1), r1=116(y1), r2=156(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 116
LDI r2, 156
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
