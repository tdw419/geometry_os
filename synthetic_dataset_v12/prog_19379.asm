; DESCRIPTION: Draws a yellow line from (406, 88) to (241, 192).
; PLAN: r0=406(x1), r1=88(y1), r2=241(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 88
LDI r2, 241
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
