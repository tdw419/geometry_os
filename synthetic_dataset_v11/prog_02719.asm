; DESCRIPTION: Draws a yellow line from (28, 198) to (18, 170).
; PLAN: r0=28(x1), r1=198(y1), r2=18(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 198
LDI r2, 18
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
