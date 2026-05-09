; DESCRIPTION: Draws a black line from (149, 189) to (246, 239).
; PLAN: r0=149(x1), r1=189(y1), r2=246(x2), r3=239(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 189
LDI r2, 246
LDI r3, 239
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
