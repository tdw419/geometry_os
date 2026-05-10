; DESCRIPTION: Composite: Draws a purple rectangle at (212, 62) with width 46 and height 44 then Renders a blue disk with center (346, 105) and radius 72 then Sets a single cyan pixel at (425, 186).
; PLAN: r0=212(x), r1=62(y), r2=46(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=346(x), r6=105(y), r7=72(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=425(x), r11=186(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 212
LDI r1, 62
LDI r2, 46
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 105
LDI r7, 72
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 425
LDI r11, 186
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
