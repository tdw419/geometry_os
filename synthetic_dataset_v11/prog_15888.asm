; DESCRIPTION: Renders a yellow line between points (35, 157) and (114, 176).
; PLAN: r0=35(x1), r1=157(y1), r2=114(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 157
LDI r2, 114
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
