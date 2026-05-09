; DESCRIPTION: Renders a yellow line between points (193, 168) and (155, 176).
; PLAN: r0=193(x1), r1=168(y1), r2=155(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 168
LDI r2, 155
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
