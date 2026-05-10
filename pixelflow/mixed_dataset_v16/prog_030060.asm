; DESCRIPTION: Draws a yellow line from (418, 101) to (296, 248).
; PLAN: r0=418(x1), r1=101(y1), r2=296(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 101
LDI r2, 296
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
