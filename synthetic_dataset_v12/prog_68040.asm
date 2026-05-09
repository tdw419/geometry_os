; DESCRIPTION: Renders a black line between points (234, 101) and (455, 28).
; PLAN: r0=234(x1), r1=101(y1), r2=455(x2), r3=28(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 101
LDI r2, 455
LDI r3, 28
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
