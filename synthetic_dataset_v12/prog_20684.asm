; DESCRIPTION: Draws a red line from (493, 17) to (496, 35).
; PLAN: r0=493(x1), r1=17(y1), r2=496(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 17
LDI r2, 496
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
