; DESCRIPTION: Draws a yellow line from (8, 159) to (76, 199).
; PLAN: r0=8(x1), r1=159(y1), r2=76(x2), r3=199(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 159
LDI r2, 76
LDI r3, 199
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
