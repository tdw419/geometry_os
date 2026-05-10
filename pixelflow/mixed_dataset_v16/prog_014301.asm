; DESCRIPTION: Composite: Renders a red box of size 26x110 starting at (341, 146) then Sets a single green pixel at (221, 62) then Draws a white circle centered at (407, 75) with radius 39.
; PLAN: r0=341(x), r1=146(y), r2=26(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=221(x), r6=62(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=407(x), r11=75(y), r12=39(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 341
LDI r1, 146
LDI r2, 26
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 62
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 407
LDI r11, 75
LDI r12, 39
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
