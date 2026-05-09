; DESCRIPTION: Draws a black line from (122, 153) to (29, 163).
; PLAN: r0=122(x1), r1=153(y1), r2=29(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 153
LDI r2, 29
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
