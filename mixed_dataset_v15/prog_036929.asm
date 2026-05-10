; DESCRIPTION: Draws a green line from (108, 36) to (312, 121).
; PLAN: r0=108(x1), r1=36(y1), r2=312(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 36
LDI r2, 312
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
