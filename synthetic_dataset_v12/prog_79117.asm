; DESCRIPTION: Draws a black line from (493, 166) to (321, 23).
; PLAN: r0=493(x1), r1=166(y1), r2=321(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 166
LDI r2, 321
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
