; DESCRIPTION: Composite: Places a orange dot at position (407, 235) then Draws a magenta circle centered at (391, 73) with radius 24 then Renders a magenta box of size 12x113 starting at (375, 1).
; PLAN: r0=407(x), r1=235(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=391(x), r6=73(y), r7=24(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=375(x), r11=1(y), r12=12(width), r13=113(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 407
LDI r1, 235
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 391
LDI r6, 73
LDI r7, 24
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 375
LDI r11, 1
LDI r12, 12
LDI r13, 113
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
