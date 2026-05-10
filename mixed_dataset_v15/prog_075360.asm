; DESCRIPTION: Draws a black line from (162, 142) to (246, 224).
; PLAN: r0=162(x1), r1=142(y1), r2=246(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 142
LDI r2, 246
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
