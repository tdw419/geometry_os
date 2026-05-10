; DESCRIPTION: Composite: Draws a yellow rectangle at (378, 145) with width 49 and height 46 then Renders a cyan disk with center (105, 152) and radius 56 then Sets a single green pixel at (187, 224).
; PLAN: r0=378(x), r1=145(y), r2=49(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x), r6=152(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=187(x), r11=224(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 378
LDI r1, 145
LDI r2, 49
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 152
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 187
LDI r11, 224
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
