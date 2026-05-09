; DESCRIPTION: Draws a black line from (78, 192) to (456, 115).
; PLAN: r0=78(x1), r1=192(y1), r2=456(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 192
LDI r2, 456
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
