; DESCRIPTION: Renders a green line between points (243, 232) and (323, 157).
; PLAN: r0=243(x1), r1=232(y1), r2=323(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 232
LDI r2, 323
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
