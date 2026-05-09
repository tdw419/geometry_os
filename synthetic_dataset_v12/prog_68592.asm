; DESCRIPTION: Draws a blue line from (301, 141) to (130, 9).
; PLAN: r0=301(x1), r1=141(y1), r2=130(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 141
LDI r2, 130
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
