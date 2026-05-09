; DESCRIPTION: Draws a black line from (115, 82) to (72, 129).
; PLAN: r0=115(x1), r1=82(y1), r2=72(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 82
LDI r2, 72
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
