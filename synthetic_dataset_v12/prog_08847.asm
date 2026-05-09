; DESCRIPTION: Composite: Sets a single black pixel at (351, 27) then Creates a blue circular shape at (355, 146) with radius 11 then Renders a white box of size 13x98 starting at (126, 3).
; PLAN: r0=351(x), r1=27(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=355(x), r6=146(y), r7=11(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=126(x), r11=3(y), r12=13(width), r13=98(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 351
LDI r1, 27
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 355
LDI r6, 146
LDI r7, 11
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 126
LDI r11, 3
LDI r12, 13
LDI r13, 98
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
