; DESCRIPTION: Draws a black line from (1, 91) to (58, 53).
; PLAN: r0=1(x1), r1=91(y1), r2=58(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 91
LDI r2, 58
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
