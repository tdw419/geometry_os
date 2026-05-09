; DESCRIPTION: Draws a black line from (427, 86) to (53, 186).
; PLAN: r0=427(x1), r1=86(y1), r2=53(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 86
LDI r2, 53
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
