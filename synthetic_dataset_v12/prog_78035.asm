; DESCRIPTION: Draws a black line from (493, 156) to (79, 33).
; PLAN: r0=493(x1), r1=156(y1), r2=79(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 156
LDI r2, 79
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
