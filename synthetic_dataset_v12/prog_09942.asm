; DESCRIPTION: Draws a black line from (310, 236) to (84, 92).
; PLAN: r0=310(x1), r1=236(y1), r2=84(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 236
LDI r2, 84
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
