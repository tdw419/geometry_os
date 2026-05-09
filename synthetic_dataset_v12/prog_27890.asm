; DESCRIPTION: Draws a blue line from (156, 97) to (223, 246).
; PLAN: r0=156(x1), r1=97(y1), r2=223(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 97
LDI r2, 223
LDI r3, 246
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
