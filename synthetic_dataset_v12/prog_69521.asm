; DESCRIPTION: Draws a black line from (94, 166) to (88, 137).
; PLAN: r0=94(x1), r1=166(y1), r2=88(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 166
LDI r2, 88
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
