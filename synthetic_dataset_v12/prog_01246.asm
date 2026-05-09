; DESCRIPTION: Draws a green line from (421, 15) to (461, 203).
; PLAN: r0=421(x1), r1=15(y1), r2=461(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 15
LDI r2, 461
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
