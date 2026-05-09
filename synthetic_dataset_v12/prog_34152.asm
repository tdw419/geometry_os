; DESCRIPTION: Draws a yellow line from (299, 106) to (381, 98).
; PLAN: r0=299(x1), r1=106(y1), r2=381(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 106
LDI r2, 381
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
