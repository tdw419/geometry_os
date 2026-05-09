; DESCRIPTION: Renders a yellow line between points (384, 169) and (70, 12).
; PLAN: r0=384(x1), r1=169(y1), r2=70(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 169
LDI r2, 70
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
