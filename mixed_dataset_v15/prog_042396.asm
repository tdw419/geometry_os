; DESCRIPTION: Composite: Sets a single cyan pixel at (64, 69) then Places a orange 45x100 rectangle at position (67, 93) then Draws a blue circle centered at (391, 79) with radius 69.
; PLAN: r0=64(x), r1=69(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=93(y), r7=45(width), r8=100(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=391(x), r11=79(y), r12=69(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 64
LDI r1, 69
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 67
LDI r6, 93
LDI r7, 45
LDI r8, 100
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 79
LDI r12, 69
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
