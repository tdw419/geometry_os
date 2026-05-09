; DESCRIPTION: Composite: Places a black dot at position (192, 189) then Creates a cyan rectangular region at (66, 210) spanning 76 by 43 pixels then Draws a yellow circle centered at (331, 148) with radius 70.
; PLAN: r0=192(x), r1=189(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=66(x), r6=210(y), r7=76(width), r8=43(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=331(x), r11=148(y), r12=70(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 192
LDI r1, 189
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 66
LDI r6, 210
LDI r7, 76
LDI r8, 43
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 148
LDI r12, 70
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
