; DESCRIPTION: Draws a yellow line from (385, 24) to (191, 222).
; PLAN: r0=385(x1), r1=24(y1), r2=191(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 24
LDI r2, 191
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
