; DESCRIPTION: Composite: Renders a cyan box of size 33x22 starting at (341, 83) then Sets a single white pixel at (344, 121) then Draws a white circle centered at (40, 142) with radius 38.
; PLAN: r0=341(x), r1=83(y), r2=33(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x), r6=121(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=40(x), r11=142(y), r12=38(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 341
LDI r1, 83
LDI r2, 33
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 121
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 40
LDI r11, 142
LDI r12, 38
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
