; DESCRIPTION: Composite: Sets a single black pixel at (85, 137) then Draws a white circle centered at (66, 114) with radius 52 then Places a purple 58x54 rectangle at position (44, 143).
; PLAN: r0=85(x), r1=137(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=66(x), r6=114(y), r7=52(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=44(x), r11=143(y), r12=58(width), r13=54(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 137
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 66
LDI r6, 114
LDI r7, 52
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 44
LDI r11, 143
LDI r12, 58
LDI r13, 54
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
