; DESCRIPTION: Draws a yellow line from (324, 85) to (233, 138).
; PLAN: r0=324(x1), r1=85(y1), r2=233(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 85
LDI r2, 233
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
