; DESCRIPTION: Composite: Renders a black disk with center (430, 88) and radius 39 then Draws a yellow line from (353, 184) to (50, 222).
; PLAN: r0=430(x), r1=88(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x1), r6=184(y1), r7=50(x2), r8=222(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 88
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 184
LDI r7, 50
LDI r8, 222
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
