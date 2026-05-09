; DESCRIPTION: Draws a black line from (203, 15) to (81, 76).
; PLAN: r0=203(x1), r1=15(y1), r2=81(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 15
LDI r2, 81
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
