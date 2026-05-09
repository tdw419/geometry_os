; DESCRIPTION: Draws a black line from (468, 252) to (165, 92).
; PLAN: r0=468(x1), r1=252(y1), r2=165(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 252
LDI r2, 165
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
