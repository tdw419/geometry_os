; DESCRIPTION: Draws a black line from (74, 198) to (90, 160).
; PLAN: r0=74(x1), r1=198(y1), r2=90(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 198
LDI r2, 90
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
