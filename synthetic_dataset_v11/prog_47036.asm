; DESCRIPTION: Renders a yellow line between points (214, 136) and (231, 222).
; PLAN: r0=214(x1), r1=136(y1), r2=231(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 136
LDI r2, 231
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
