; DESCRIPTION: Draws a yellow line from (121, 18) to (395, 173).
; PLAN: r0=121(x1), r1=18(y1), r2=395(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 18
LDI r2, 395
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
