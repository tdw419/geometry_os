; DESCRIPTION: Composite: Sets a single blue pixel at (406, 164) then Creates a white circular shape at (474, 103) with radius 15 then Draws a magenta rectangle at (41, 80) with width 74 and height 52.
; PLAN: r0=406(x), r1=164(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=474(x), r6=103(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=41(x), r11=80(y), r12=74(width), r13=52(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 406
LDI r1, 164
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 474
LDI r6, 103
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 41
LDI r11, 80
LDI r12, 74
LDI r13, 52
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
