; DESCRIPTION: Draws a black line from (229, 161) to (76, 121).
; PLAN: r0=229(x1), r1=161(y1), r2=76(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 161
LDI r2, 76
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
