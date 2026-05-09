; DESCRIPTION: Draws a black line from (116, 189) to (128, 58).
; PLAN: r0=116(x1), r1=189(y1), r2=128(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 189
LDI r2, 128
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
