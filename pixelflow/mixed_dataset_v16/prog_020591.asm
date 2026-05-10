; DESCRIPTION: Composite: Places a black dot at position (354, 103) then Draws a cyan circle centered at (388, 89) with radius 15 then Draws a purple rectangle at (430, 146) with width 42 and height 57.
; PLAN: r0=354(x), r1=103(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=388(x), r6=89(y), r7=15(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=430(x), r11=146(y), r12=42(width), r13=57(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 103
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 388
LDI r6, 89
LDI r7, 15
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 430
LDI r11, 146
LDI r12, 42
LDI r13, 57
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
