; DESCRIPTION: Renders a black line between points (127, 24) and (181, 157).
; PLAN: r0=127(x1), r1=24(y1), r2=181(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 24
LDI r2, 181
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
