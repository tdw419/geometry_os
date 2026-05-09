; DESCRIPTION: Draws a black line from (350, 94) to (149, 149).
; PLAN: r0=350(x1), r1=94(y1), r2=149(x2), r3=149(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 94
LDI r2, 149
LDI r3, 149
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
