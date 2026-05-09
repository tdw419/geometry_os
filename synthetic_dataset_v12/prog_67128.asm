; DESCRIPTION: Draws a yellow line from (384, 198) to (271, 165).
; PLAN: r0=384(x1), r1=198(y1), r2=271(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 198
LDI r2, 271
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
