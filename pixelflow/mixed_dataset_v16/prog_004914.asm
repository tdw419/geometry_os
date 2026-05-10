; DESCRIPTION: Composite: Sets a single black pixel at (250, 99) then Places a white circle of radius 64 at center (70, 164) then Draws a cyan rectangle at (95, 34) with width 52 and height 37.
; PLAN: r0=250(x), r1=99(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=70(x), r6=164(y), r7=64(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=95(x), r11=34(y), r12=52(width), r13=37(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 250
LDI r1, 99
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 70
LDI r6, 164
LDI r7, 64
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 95
LDI r11, 34
LDI r12, 52
LDI r13, 37
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
