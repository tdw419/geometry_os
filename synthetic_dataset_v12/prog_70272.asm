; DESCRIPTION: Draws a yellow line from (411, 88) to (449, 7).
; PLAN: r0=411(x1), r1=88(y1), r2=449(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 88
LDI r2, 449
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
