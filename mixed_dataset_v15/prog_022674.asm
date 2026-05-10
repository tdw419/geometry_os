; DESCRIPTION: Composite: Draws a white rectangle at (470, 75) with width 19 and height 42 then Renders a white line between points (11, 13) and (204, 242) then Renders a black disk with center (449, 199) and radius 54.
; PLAN: r0=470(x), r1=75(y), r2=19(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=11(x1), r6=13(y1), r7=204(x2), r8=242(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=449(x), r11=199(y), r12=54(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 470
LDI r1, 75
LDI r2, 19
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 13
LDI r7, 204
LDI r8, 242
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 449
LDI r11, 199
LDI r12, 54
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
