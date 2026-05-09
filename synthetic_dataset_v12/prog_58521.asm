; DESCRIPTION: Renders a yellow line between points (108, 44) and (336, 248).
; PLAN: r0=108(x1), r1=44(y1), r2=336(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 44
LDI r2, 336
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
