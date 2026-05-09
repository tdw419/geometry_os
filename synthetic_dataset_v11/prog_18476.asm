; DESCRIPTION: Draws a black line from (26, 73) to (122, 223).
; PLAN: r0=26(x1), r1=73(y1), r2=122(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 73
LDI r2, 122
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
