; DESCRIPTION: Renders a black line between points (73, 13) and (11, 198).
; PLAN: r0=73(x1), r1=13(y1), r2=11(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 13
LDI r2, 11
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
