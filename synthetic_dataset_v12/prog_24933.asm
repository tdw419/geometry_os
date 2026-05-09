; DESCRIPTION: Draws a black line from (270, 224) to (183, 18).
; PLAN: r0=270(x1), r1=224(y1), r2=183(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 224
LDI r2, 183
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
