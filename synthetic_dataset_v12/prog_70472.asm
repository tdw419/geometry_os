; DESCRIPTION: Composite: Places a white 39x16 rectangle at position (42, 99) then Places a white dot at position (344, 197) then Draws a magenta circle centered at (462, 85) with radius 45.
; PLAN: r0=42(x), r1=99(y), r2=39(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x), r6=197(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=462(x), r11=85(y), r12=45(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 42
LDI r1, 99
LDI r2, 39
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 197
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 462
LDI r11, 85
LDI r12, 45
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
