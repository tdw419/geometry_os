; DESCRIPTION: Draws a blue line from (430, 161) to (333, 9).
; PLAN: r0=430(x1), r1=161(y1), r2=333(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 161
LDI r2, 333
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
