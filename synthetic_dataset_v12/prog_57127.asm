; DESCRIPTION: Composite: Places a magenta dot at position (31, 123) then Draws a blue circle centered at (107, 85) with radius 46 then Creates a cyan rectangular region at (324, 108) spanning 47 by 50 pixels.
; PLAN: r0=31(x), r1=123(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=107(x), r6=85(y), r7=46(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=324(x), r11=108(y), r12=47(width), r13=50(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 123
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 107
LDI r6, 85
LDI r7, 46
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 324
LDI r11, 108
LDI r12, 47
LDI r13, 50
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
