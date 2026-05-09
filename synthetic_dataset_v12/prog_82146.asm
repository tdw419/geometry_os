; DESCRIPTION: Draws a yellow line from (485, 230) to (11, 121).
; PLAN: r0=485(x1), r1=230(y1), r2=11(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 230
LDI r2, 11
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
