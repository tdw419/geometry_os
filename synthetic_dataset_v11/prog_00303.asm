; DESCRIPTION: Draws a black line from (217, 9) to (55, 156).
; PLAN: r0=217(x1), r1=9(y1), r2=55(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 9
LDI r2, 55
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
