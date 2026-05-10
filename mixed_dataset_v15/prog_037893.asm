; DESCRIPTION: Composite: Draws a yellow rectangle at (88, 33) with width 37 and height 20 then Places a magenta line segment connecting (458, 170) to (63, 35) then Renders a white disk with center (81, 209) and radius 39.
; PLAN: r0=88(x), r1=33(y), r2=37(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=458(x1), r6=170(y1), r7=63(x2), r8=35(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=81(x), r11=209(y), r12=39(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 88
LDI r1, 33
LDI r2, 37
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 170
LDI r7, 63
LDI r8, 35
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 209
LDI r12, 39
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
