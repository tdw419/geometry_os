; DESCRIPTION: Composite: Renders a red disk with center (359, 24) and radius 14 then Sets a single red pixel at (294, 0) then Draws a orange rectangle at (101, 138) with width 21 and height 24.
; PLAN: r0=359(x), r1=24(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x), r6=0(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=101(x), r11=138(y), r12=21(width), r13=24(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 359
LDI r1, 24
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 0
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 101
LDI r11, 138
LDI r12, 21
LDI r13, 24
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
