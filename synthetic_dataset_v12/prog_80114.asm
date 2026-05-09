; DESCRIPTION: Renders a yellow line between points (328, 17) and (1, 197).
; PLAN: r0=328(x1), r1=17(y1), r2=1(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 17
LDI r2, 1
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
