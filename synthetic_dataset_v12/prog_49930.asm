; DESCRIPTION: Draws a black line from (302, 113) to (456, 216).
; PLAN: r0=302(x1), r1=113(y1), r2=456(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 113
LDI r2, 456
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
