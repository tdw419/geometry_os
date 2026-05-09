; DESCRIPTION: Composite: Draws a white rectangle at (18, 30) with width 97 and height 90 then Sets a single cyan pixel at (239, 111) then Places a green circle of radius 15 at center (135, 116).
; PLAN: r0=18(x), r1=30(y), r2=97(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=239(x), r6=111(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=135(x), r11=116(y), r12=15(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 18
LDI r1, 30
LDI r2, 97
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 111
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 135
LDI r11, 116
LDI r12, 15
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
