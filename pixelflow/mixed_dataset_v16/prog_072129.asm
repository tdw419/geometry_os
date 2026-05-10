; DESCRIPTION: Draws a black line from (384, 125) to (324, 203).
; PLAN: r0=384(x1), r1=125(y1), r2=324(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 125
LDI r2, 324
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
