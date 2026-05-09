; DESCRIPTION: Composite: Renders a cyan disk with center (77, 128) and radius 25 then Draws a cyan rectangle at (358, 15) with width 113 and height 83 then Sets a single white pixel at (44, 82).
; PLAN: r0=77(x), r1=128(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x), r6=15(y), r7=113(width), r8=83(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=44(x), r11=82(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 77
LDI r1, 128
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 15
LDI r7, 113
LDI r8, 83
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 44
LDI r11, 82
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
