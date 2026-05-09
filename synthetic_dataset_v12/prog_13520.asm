; DESCRIPTION: Draws a black line from (454, 97) to (48, 232).
; PLAN: r0=454(x1), r1=97(y1), r2=48(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 97
LDI r2, 48
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
