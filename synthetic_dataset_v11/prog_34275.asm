; DESCRIPTION: Draws a blue line from (238, 187) to (46, 15).
; PLAN: r0=238(x1), r1=187(y1), r2=46(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 187
LDI r2, 46
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
