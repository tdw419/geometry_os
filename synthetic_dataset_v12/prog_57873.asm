; DESCRIPTION: Draws a blue line from (437, 246) to (333, 29).
; PLAN: r0=437(x1), r1=246(y1), r2=333(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 246
LDI r2, 333
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
