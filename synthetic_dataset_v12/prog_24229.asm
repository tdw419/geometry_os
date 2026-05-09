; DESCRIPTION: Composite: Draws a yellow rectangle at (248, 129) with width 104 and height 64 then Renders a orange disk with center (165, 194) and radius 56 then Sets a single yellow pixel at (115, 22).
; PLAN: r0=248(x), r1=129(y), r2=104(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=165(x), r6=194(y), r7=56(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=115(x), r11=22(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 248
LDI r1, 129
LDI r2, 104
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 194
LDI r7, 56
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 115
LDI r11, 22
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
