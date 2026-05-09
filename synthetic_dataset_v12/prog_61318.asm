; DESCRIPTION: Draws a yellow line from (336, 216) to (117, 40).
; PLAN: r0=336(x1), r1=216(y1), r2=117(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 216
LDI r2, 117
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
