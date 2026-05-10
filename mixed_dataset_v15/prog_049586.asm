; DESCRIPTION: Composite: Places a magenta dot at position (256, 25) then Creates a orange rectangular region at (223, 36) spanning 50 by 68 pixels then Draws a black circle centered at (109, 19) with radius 12.
; PLAN: r0=256(x), r1=25(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=223(x), r6=36(y), r7=50(width), r8=68(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=109(x), r11=19(y), r12=12(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 256
LDI r1, 25
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 36
LDI r7, 50
LDI r8, 68
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 109
LDI r11, 19
LDI r12, 12
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
