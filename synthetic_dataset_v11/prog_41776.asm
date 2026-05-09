; DESCRIPTION: Renders a black line between points (86, 249) and (2, 127).
; PLAN: r0=86(x1), r1=249(y1), r2=2(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 249
LDI r2, 2
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
