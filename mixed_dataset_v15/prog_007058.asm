; DESCRIPTION: Composite: Sets a single white pixel at (197, 171) then Places a blue circle of radius 60 at center (235, 172) then Draws a orange rectangle at (111, 40) with width 81 and height 24.
; PLAN: r0=197(x), r1=171(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=235(x), r6=172(y), r7=60(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=111(x), r11=40(y), r12=81(width), r13=24(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 171
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 235
LDI r6, 172
LDI r7, 60
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 111
LDI r11, 40
LDI r12, 81
LDI r13, 24
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
