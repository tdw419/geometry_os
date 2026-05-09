; DESCRIPTION: Draws a blue line from (301, 222) to (432, 134).
; PLAN: r0=301(x1), r1=222(y1), r2=432(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 222
LDI r2, 432
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
