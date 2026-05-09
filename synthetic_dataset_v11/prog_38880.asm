; DESCRIPTION: Draws a yellow line from (62, 54) to (238, 0).
; PLAN: r0=62(x1), r1=54(y1), r2=238(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 54
LDI r2, 238
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
