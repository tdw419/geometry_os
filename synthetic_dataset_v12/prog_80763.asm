; DESCRIPTION: Renders a yellow line between points (214, 241) and (101, 39).
; PLAN: r0=214(x1), r1=241(y1), r2=101(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 241
LDI r2, 101
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
