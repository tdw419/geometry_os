; DESCRIPTION: Composite: Sets a single white pixel at (263, 25) then Creates a black circular shape at (197, 123) with radius 75 then Places a blue 76x46 rectangle at position (75, 207).
; PLAN: r0=263(x), r1=25(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=197(x), r6=123(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=75(x), r11=207(y), r12=76(width), r13=46(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 25
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 197
LDI r6, 123
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 75
LDI r11, 207
LDI r12, 76
LDI r13, 46
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
