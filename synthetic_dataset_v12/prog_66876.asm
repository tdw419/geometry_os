; DESCRIPTION: Renders a yellow line between points (455, 157) and (431, 170).
; PLAN: r0=455(x1), r1=157(y1), r2=431(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 157
LDI r2, 431
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
