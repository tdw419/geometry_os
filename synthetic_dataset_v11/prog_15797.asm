; DESCRIPTION: Draws a yellow line from (93, 130) to (231, 217).
; PLAN: r0=93(x1), r1=130(y1), r2=231(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 130
LDI r2, 231
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
