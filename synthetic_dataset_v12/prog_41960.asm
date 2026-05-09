; DESCRIPTION: Places a green line segment connecting (337, 167) to (268, 232).
; PLAN: r0=337(x1), r1=167(y1), r2=268(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 167
LDI r2, 268
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
