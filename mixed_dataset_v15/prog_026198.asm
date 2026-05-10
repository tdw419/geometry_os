; DESCRIPTION: Renders a green line between points (15, 94) and (114, 250).
; PLAN: r0=15(x1), r1=94(y1), r2=114(x2), r3=250(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 94
LDI r2, 114
LDI r3, 250
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
