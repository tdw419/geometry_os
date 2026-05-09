; DESCRIPTION: Draws a green line from (36, 88) to (233, 62).
; PLAN: r0=36(x1), r1=88(y1), r2=233(x2), r3=62(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 88
LDI r2, 233
LDI r3, 62
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
