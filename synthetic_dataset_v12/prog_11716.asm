; DESCRIPTION: Draws a black line from (58, 206) to (26, 133).
; PLAN: r0=58(x1), r1=206(y1), r2=26(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 206
LDI r2, 26
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
