; DESCRIPTION: Composite: Creates a cyan circular shape at (279, 94) with radius 69 then Places a orange dot at position (442, 24) then Draws a yellow rectangle at (36, 47) with width 105 and height 23.
; PLAN: r0=279(x), r1=94(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=442(x), r6=24(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=36(x), r11=47(y), r12=105(width), r13=23(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 94
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 442
LDI r6, 24
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 36
LDI r11, 47
LDI r12, 105
LDI r13, 23
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
