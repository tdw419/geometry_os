; DESCRIPTION: Draws a black line from (291, 46) to (287, 198).
; PLAN: r0=291(x1), r1=46(y1), r2=287(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 46
LDI r2, 287
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
