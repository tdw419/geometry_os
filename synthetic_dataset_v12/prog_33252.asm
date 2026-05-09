; DESCRIPTION: Draws a black line from (56, 66) to (496, 55).
; PLAN: r0=56(x1), r1=66(y1), r2=496(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 66
LDI r2, 496
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
