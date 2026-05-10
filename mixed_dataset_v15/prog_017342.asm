; DESCRIPTION: Renders a yellow line between points (339, 17) and (108, 160).
; PLAN: r0=339(x1), r1=17(y1), r2=108(x2), r3=160(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 17
LDI r2, 108
LDI r3, 160
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
