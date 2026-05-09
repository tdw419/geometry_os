; DESCRIPTION: Composite: Renders a white disk with center (376, 111) and radius 43 then Draws a white rectangle at (279, 93) with width 51 and height 20 then Places a yellow dot at position (500, 21).
; PLAN: r0=376(x), r1=111(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x), r6=93(y), r7=51(width), r8=20(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=500(x), r11=21(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 376
LDI r1, 111
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 93
LDI r7, 51
LDI r8, 20
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 500
LDI r11, 21
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
