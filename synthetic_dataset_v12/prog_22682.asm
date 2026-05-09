; DESCRIPTION: Composite: Sets a single purple pixel at (87, 86) then Draws a yellow rectangle at (170, 48) with width 45 and height 72 then Places a purple circle of radius 49 at center (224, 77).
; PLAN: r0=87(x), r1=86(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=170(x), r6=48(y), r7=45(width), r8=72(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=224(x), r11=77(y), r12=49(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 87
LDI r1, 86
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 170
LDI r6, 48
LDI r7, 45
LDI r8, 72
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 224
LDI r11, 77
LDI r12, 49
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
