; DESCRIPTION: Draws a black line from (449, 198) to (86, 1).
; PLAN: r0=449(x1), r1=198(y1), r2=86(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 198
LDI r2, 86
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
