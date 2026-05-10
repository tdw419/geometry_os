; DESCRIPTION: Draws a black line from (55, 28) to (139, 184).
; PLAN: r0=55(x1), r1=28(y1), r2=139(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 28
LDI r2, 139
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
