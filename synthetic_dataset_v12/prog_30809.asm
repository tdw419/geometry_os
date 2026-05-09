; DESCRIPTION: Renders a black line between points (189, 131) and (24, 144).
; PLAN: r0=189(x1), r1=131(y1), r2=24(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 131
LDI r2, 24
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
