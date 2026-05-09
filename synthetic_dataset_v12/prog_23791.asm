; DESCRIPTION: Draws a yellow line from (212, 29) to (384, 6).
; PLAN: r0=212(x1), r1=29(y1), r2=384(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 29
LDI r2, 384
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
