; DESCRIPTION: Composite: Draws a orange rectangle at (220, 135) with width 67 and height 44 then Sets a single green pixel at (303, 132) then Creates a black circular shape at (160, 102) with radius 65.
; PLAN: r0=220(x), r1=135(y), r2=67(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x), r6=132(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=160(x), r11=102(y), r12=65(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 220
LDI r1, 135
LDI r2, 67
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 132
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 160
LDI r11, 102
LDI r12, 65
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
