; DESCRIPTION: Draws a black line from (47, 62) to (53, 135).
; PLAN: r0=47(x1), r1=62(y1), r2=53(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 62
LDI r2, 53
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
