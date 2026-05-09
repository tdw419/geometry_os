; DESCRIPTION: Draws a blue line from (181, 41) to (255, 94).
; PLAN: r0=181(x1), r1=41(y1), r2=255(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 41
LDI r2, 255
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
