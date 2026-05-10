; DESCRIPTION: Composite: Sets a single green pixel at (373, 117) then Renders a purple box of size 78x19 starting at (165, 185) then Draws a yellow circle centered at (391, 122) with radius 47.
; PLAN: r0=373(x), r1=117(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=185(y), r7=78(width), r8=19(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=391(x), r11=122(y), r12=47(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 373
LDI r1, 117
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 165
LDI r6, 185
LDI r7, 78
LDI r8, 19
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 122
LDI r12, 47
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
