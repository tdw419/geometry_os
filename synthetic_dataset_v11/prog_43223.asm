; DESCRIPTION: Renders a yellow line between points (231, 67) and (251, 17).
; PLAN: r0=231(x1), r1=67(y1), r2=251(x2), r3=17(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 67
LDI r2, 251
LDI r3, 17
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
