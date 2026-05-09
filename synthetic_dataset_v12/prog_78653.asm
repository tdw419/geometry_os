; DESCRIPTION: Renders a yellow line between points (383, 156) and (214, 122).
; PLAN: r0=383(x1), r1=156(y1), r2=214(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 156
LDI r2, 214
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
