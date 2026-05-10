; DESCRIPTION: Draws a yellow line from (278, 73) to (223, 98).
; PLAN: r0=278(x1), r1=73(y1), r2=223(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 73
LDI r2, 223
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
