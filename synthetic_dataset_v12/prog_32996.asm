; DESCRIPTION: Composite: Places a blue dot at position (196, 232) then Renders a black disk with center (377, 159) and radius 26 then Renders a green line between points (324, 34) and (25, 86).
; PLAN: r0=196(x), r1=232(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=377(x), r6=159(y), r7=26(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=324(x1), r11=34(y1), r12=25(x2), r13=86(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 232
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 377
LDI r6, 159
LDI r7, 26
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 324
LDI r11, 34
LDI r12, 25
LDI r13, 86
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
