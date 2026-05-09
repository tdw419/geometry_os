; DESCRIPTION: Renders a black line between points (144, 56) and (455, 238).
; PLAN: r0=144(x1), r1=56(y1), r2=455(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 56
LDI r2, 455
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
