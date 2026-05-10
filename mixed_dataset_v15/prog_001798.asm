; DESCRIPTION: Composite: Creates a white rectangular region at (298, 130) spanning 51 by 86 pixels then Places a orange dot at position (258, 200) then Draws a red circle centered at (272, 195) with radius 61.
; PLAN: r0=298(x), r1=130(y), r2=51(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x), r6=200(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=272(x), r11=195(y), r12=61(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 298
LDI r1, 130
LDI r2, 51
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 200
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 272
LDI r11, 195
LDI r12, 61
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
