; DESCRIPTION: Composite: Draws a orange circle centered at (306, 154) with radius 57 then Creates a magenta rectangular region at (448, 129) spanning 17 by 24 pixels then Places a orange dot at position (170, 216).
; PLAN: r0=306(x), r1=154(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=448(x), r6=129(y), r7=17(width), r8=24(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=170(x), r11=216(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 306
LDI r1, 154
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 448
LDI r6, 129
LDI r7, 17
LDI r8, 24
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 170
LDI r11, 216
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
