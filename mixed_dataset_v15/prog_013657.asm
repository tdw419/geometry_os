; DESCRIPTION: Composite: Creates a cyan circular shape at (418, 121) with radius 16 then Draws a green rectangle at (194, 174) with width 29 and height 32 then Sets a single green pixel at (167, 110).
; PLAN: r0=418(x), r1=121(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=174(y), r7=29(width), r8=32(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=167(x), r11=110(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 418
LDI r1, 121
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 174
LDI r7, 29
LDI r8, 32
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 167
LDI r11, 110
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
