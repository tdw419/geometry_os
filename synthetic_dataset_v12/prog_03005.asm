; DESCRIPTION: Draws a black line from (198, 16) to (358, 116).
; PLAN: r0=198(x1), r1=16(y1), r2=358(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 16
LDI r2, 358
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
