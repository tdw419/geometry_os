; DESCRIPTION: Draws a black line from (379, 151) to (380, 115).
; PLAN: r0=379(x1), r1=151(y1), r2=380(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 151
LDI r2, 380
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
