; DESCRIPTION: Draws a black line from (366, 161) to (462, 133).
; PLAN: r0=366(x1), r1=161(y1), r2=462(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 161
LDI r2, 462
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
