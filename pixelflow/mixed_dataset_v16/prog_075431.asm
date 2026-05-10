; DESCRIPTION: Draws a black line from (200, 72) to (11, 2).
; PLAN: r0=200(x1), r1=72(y1), r2=11(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 72
LDI r2, 11
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
