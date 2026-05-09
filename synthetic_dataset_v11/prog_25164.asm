; DESCRIPTION: Composite: . Then Renders a black disk with center (129, 124) and radius 74. Then Draws a yellow line from (147, 205) to (54, 21).
; PLAN: r0=129(x), r1=124(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=147(x1), r1=205(y1), r2=54(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (129, 124) and radius 74.
; PLAN: r0=129(x), r1=124(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 124
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow line from (147, 205) to (54, 21).
; PLAN: r0=147(x1), r1=205(y1), r2=54(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 205
LDI r2, 54
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
