; DESCRIPTION: Draws a black line from (97, 130) to (128, 245).
; PLAN: r0=97(x1), r1=130(y1), r2=128(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 130
LDI r2, 128
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
