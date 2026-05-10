; DESCRIPTION: Composite: Sets a single black pixel at (490, 140) then Draws a cyan rectangle at (458, 183) with width 43 and height 21 then Places a black circle of radius 43 at center (340, 186).
; PLAN: r0=490(x), r1=140(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=458(x), r6=183(y), r7=43(width), r8=21(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=340(x), r11=186(y), r12=43(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 490
LDI r1, 140
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 458
LDI r6, 183
LDI r7, 43
LDI r8, 21
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 186
LDI r12, 43
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
