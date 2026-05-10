; DESCRIPTION: Draws a black line from (147, 207) to (416, 116).
; PLAN: r0=147(x1), r1=207(y1), r2=416(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 207
LDI r2, 416
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
