; DESCRIPTION: Composite: Draws a green rectangle at (173, 28) with width 120 and height 29 then Renders a cyan disk with center (178, 117) and radius 40 then Places a black dot at position (322, 196).
; PLAN: r0=173(x), r1=28(y), r2=120(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=117(y), r7=40(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=322(x), r11=196(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 173
LDI r1, 28
LDI r2, 120
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 117
LDI r7, 40
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 322
LDI r11, 196
LDI r12, 0x000000
PSET r10, r11, r12
HALT
