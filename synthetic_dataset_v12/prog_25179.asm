; DESCRIPTION: Renders a yellow line between points (310, 180) and (212, 66).
; PLAN: r0=310(x1), r1=180(y1), r2=212(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 180
LDI r2, 212
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
