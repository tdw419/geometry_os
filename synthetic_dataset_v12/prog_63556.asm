; DESCRIPTION: Composite: Sets a single green pixel at (176, 144) then Draws a yellow rectangle at (312, 149) with width 115 and height 103 then Creates a orange circular shape at (212, 162) with radius 68.
; PLAN: r0=176(x), r1=144(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=149(y), r7=115(width), r8=103(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=212(x), r11=162(y), r12=68(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 176
LDI r1, 144
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 312
LDI r6, 149
LDI r7, 115
LDI r8, 103
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 212
LDI r11, 162
LDI r12, 68
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
