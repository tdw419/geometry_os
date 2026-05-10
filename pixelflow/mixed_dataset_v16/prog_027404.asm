; DESCRIPTION: Draws a yellow line from (117, 121) to (301, 88).
; PLAN: r0=117(x1), r1=121(y1), r2=301(x2), r3=88(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 121
LDI r2, 301
LDI r3, 88
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
