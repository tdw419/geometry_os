; DESCRIPTION: Composite: Places a orange 34x37 rectangle at position (197, 15) then Sets a single white pixel at (124, 46) then Draws a white circle centered at (242, 191) with radius 39.
; PLAN: r0=197(x), r1=15(y), r2=34(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=124(x), r6=46(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=242(x), r11=191(y), r12=39(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 197
LDI r1, 15
LDI r2, 34
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 124
LDI r6, 46
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 242
LDI r11, 191
LDI r12, 39
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
