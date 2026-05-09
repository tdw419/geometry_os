; DESCRIPTION: Draws a black line from (97, 130) to (239, 248).
; PLAN: r0=97(x1), r1=130(y1), r2=239(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 130
LDI r2, 239
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
