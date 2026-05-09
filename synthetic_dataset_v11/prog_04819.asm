; DESCRIPTION: Draws a black line from (89, 76) to (135, 198).
; PLAN: r0=89(x1), r1=76(y1), r2=135(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 76
LDI r2, 135
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
