; DESCRIPTION: Draws a black line from (212, 12) to (15, 115).
; PLAN: r0=212(x1), r1=12(y1), r2=15(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 12
LDI r2, 15
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
