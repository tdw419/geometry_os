; DESCRIPTION: Renders a yellow line between points (323, 139) and (499, 238).
; PLAN: r0=323(x1), r1=139(y1), r2=499(x2), r3=238(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 139
LDI r2, 499
LDI r3, 238
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
