; DESCRIPTION: Renders a black line between points (197, 189) and (65, 75).
; PLAN: r0=197(x1), r1=189(y1), r2=65(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 189
LDI r2, 65
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
