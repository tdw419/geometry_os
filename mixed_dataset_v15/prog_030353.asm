; DESCRIPTION: Composite: Draws a purple rectangle at (175, 128) with width 12 and height 107 then Renders a magenta disk with center (373, 124) and radius 53 then Sets a single green pixel at (415, 192).
; PLAN: r0=175(x), r1=128(y), r2=12(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=373(x), r6=124(y), r7=53(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=415(x), r11=192(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 175
LDI r1, 128
LDI r2, 12
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 124
LDI r7, 53
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 415
LDI r11, 192
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
