; DESCRIPTION: Draws a orange line from (333, 230) to (456, 121).
; PLAN: r0=333(x1), r1=230(y1), r2=456(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 230
LDI r2, 456
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
