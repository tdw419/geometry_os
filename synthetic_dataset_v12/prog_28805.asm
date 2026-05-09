; DESCRIPTION: Renders a black line between points (140, 34) and (426, 229).
; PLAN: r0=140(x1), r1=34(y1), r2=426(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 34
LDI r2, 426
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
