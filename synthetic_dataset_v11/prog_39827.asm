; DESCRIPTION: Renders a yellow line between points (161, 32) and (241, 198).
; PLAN: r0=161(x1), r1=32(y1), r2=241(x2), r3=198(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 32
LDI r2, 241
LDI r3, 198
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
