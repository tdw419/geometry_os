; DESCRIPTION: Draws a black line from (53, 90) to (469, 56).
; PLAN: r0=53(x1), r1=90(y1), r2=469(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 90
LDI r2, 469
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
