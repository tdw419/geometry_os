; DESCRIPTION: Draws a black line from (182, 40) to (53, 176).
; PLAN: r0=182(x1), r1=40(y1), r2=53(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 40
LDI r2, 53
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
