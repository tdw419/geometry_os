; DESCRIPTION: Draws a black line from (56, 248) to (384, 92).
; PLAN: r0=56(x1), r1=248(y1), r2=384(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 248
LDI r2, 384
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
