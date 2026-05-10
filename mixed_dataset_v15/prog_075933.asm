; DESCRIPTION: Composite: Renders a blue disk with center (169, 170) and radius 41 then Sets a single black pixel at (345, 77) then Draws a cyan rectangle at (286, 144) with width 36 and height 26.
; PLAN: r0=169(x), r1=170(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=345(x), r6=77(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=286(x), r11=144(y), r12=36(width), r13=26(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 169
LDI r1, 170
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 345
LDI r6, 77
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 286
LDI r11, 144
LDI r12, 36
LDI r13, 26
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
