; DESCRIPTION: Draws a yellow line from (339, 149) to (351, 81).
; PLAN: r0=339(x1), r1=149(y1), r2=351(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 149
LDI r2, 351
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
