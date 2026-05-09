; DESCRIPTION: Composite: Draws a purple circle centered at (247, 78) with radius 67 then Places a cyan dot at position (352, 59) then Creates a orange rectangular region at (279, 188) spanning 56 by 62 pixels.
; PLAN: r0=247(x), r1=78(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x), r6=59(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=279(x), r11=188(y), r12=56(width), r13=62(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 78
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 59
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 279
LDI r11, 188
LDI r12, 56
LDI r13, 62
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
