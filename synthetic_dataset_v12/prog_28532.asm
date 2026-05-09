; DESCRIPTION: Composite: Renders a blue box of size 41x111 starting at (267, 112) then Draws a purple circle centered at (295, 163) with radius 78 then Places a blue dot at position (81, 84).
; PLAN: r0=267(x), r1=112(y), r2=41(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=295(x), r6=163(y), r7=78(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=81(x), r11=84(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 267
LDI r1, 112
LDI r2, 41
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 163
LDI r7, 78
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 81
LDI r11, 84
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
