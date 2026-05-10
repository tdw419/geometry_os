; DESCRIPTION: Draws a black line from (99, 110) to (72, 53).
; PLAN: r0=99(x1), r1=110(y1), r2=72(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 110
LDI r2, 72
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
