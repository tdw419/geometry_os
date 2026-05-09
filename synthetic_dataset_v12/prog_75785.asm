; DESCRIPTION: Renders a yellow line between points (185, 221) and (130, 44).
; PLAN: r0=185(x1), r1=221(y1), r2=130(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 221
LDI r2, 130
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
