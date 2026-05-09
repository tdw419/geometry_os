; DESCRIPTION: Renders a yellow line between points (141, 86) and (386, 11).
; PLAN: r0=141(x1), r1=86(y1), r2=386(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 86
LDI r2, 386
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
