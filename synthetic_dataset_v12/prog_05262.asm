; DESCRIPTION: Composite: Draws a yellow rectangle at (428, 78) with width 24 and height 100 then Sets a single white pixel at (275, 154) then Renders a purple disk with center (339, 212) and radius 25.
; PLAN: r0=428(x), r1=78(y), r2=24(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=154(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=339(x), r11=212(y), r12=25(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 428
LDI r1, 78
LDI r2, 24
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 154
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 339
LDI r11, 212
LDI r12, 25
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
