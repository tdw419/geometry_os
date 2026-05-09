; DESCRIPTION: Draws a yellow line from (157, 57) to (43, 224).
; PLAN: r0=157(x1), r1=57(y1), r2=43(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 57
LDI r2, 43
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
