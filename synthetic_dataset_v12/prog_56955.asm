; DESCRIPTION: Draws a black line from (467, 222) to (189, 121).
; PLAN: r0=467(x1), r1=222(y1), r2=189(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 222
LDI r2, 189
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
