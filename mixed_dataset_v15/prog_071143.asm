; DESCRIPTION: Draws a yellow line from (117, 88) to (370, 191).
; PLAN: r0=117(x1), r1=88(y1), r2=370(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 88
LDI r2, 370
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
