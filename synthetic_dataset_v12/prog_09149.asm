; DESCRIPTION: Renders a black line between points (197, 54) and (360, 163).
; PLAN: r0=197(x1), r1=54(y1), r2=360(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 54
LDI r2, 360
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
