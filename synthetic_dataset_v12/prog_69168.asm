; DESCRIPTION: Draws a black line from (238, 24) to (28, 184).
; PLAN: r0=238(x1), r1=24(y1), r2=28(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 24
LDI r2, 28
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
