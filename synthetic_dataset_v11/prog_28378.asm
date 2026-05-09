; DESCRIPTION: Draws a black line from (165, 237) to (109, 116).
; PLAN: r0=165(x1), r1=237(y1), r2=109(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 237
LDI r2, 109
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
