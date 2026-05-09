; DESCRIPTION: Composite: Sets a single black pixel at (153, 205) then Draws a magenta rectangle at (386, 56) with width 26 and height 94 then Draws a purple circle centered at (433, 142) with radius 42.
; PLAN: r0=153(x), r1=205(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=386(x), r6=56(y), r7=26(width), r8=94(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=433(x), r11=142(y), r12=42(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 153
LDI r1, 205
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 386
LDI r6, 56
LDI r7, 26
LDI r8, 94
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 433
LDI r11, 142
LDI r12, 42
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
