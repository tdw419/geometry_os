; DESCRIPTION: Renders a black line between points (21, 23) and (241, 156).
; PLAN: r0=21(x1), r1=23(y1), r2=241(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 23
LDI r2, 241
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
