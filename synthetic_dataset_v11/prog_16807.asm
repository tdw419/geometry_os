; DESCRIPTION: Renders a yellow line between points (222, 99) and (53, 228).
; PLAN: r0=222(x1), r1=99(y1), r2=53(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 99
LDI r2, 53
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
