; DESCRIPTION: Composite: Draws a white rectangle at (382, 55) with width 16 and height 112 then Renders a purple disk with center (191, 159) and radius 49 then Places a black dot at position (228, 153).
; PLAN: r0=382(x), r1=55(y), r2=16(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x), r6=159(y), r7=49(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=228(x), r11=153(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 382
LDI r1, 55
LDI r2, 16
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 159
LDI r7, 49
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 228
LDI r11, 153
LDI r12, 0x000000
PSET r10, r11, r12
HALT
