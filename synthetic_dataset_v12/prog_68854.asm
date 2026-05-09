; DESCRIPTION: Draws a black line from (269, 198) to (216, 7).
; PLAN: r0=269(x1), r1=198(y1), r2=216(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 198
LDI r2, 216
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
