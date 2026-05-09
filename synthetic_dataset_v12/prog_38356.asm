; DESCRIPTION: Draws a yellow line from (143, 198) to (284, 222).
; PLAN: r0=143(x1), r1=198(y1), r2=284(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 198
LDI r2, 284
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
