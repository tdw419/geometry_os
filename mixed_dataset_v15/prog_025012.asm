; DESCRIPTION: Composite: Draws a cyan circle centered at (375, 165) with radius 52 then Places a magenta 89x20 rectangle at position (284, 157) then Places a orange dot at position (445, 212).
; PLAN: r0=375(x), r1=165(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x), r6=157(y), r7=89(width), r8=20(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=445(x), r11=212(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 375
LDI r1, 165
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 157
LDI r7, 89
LDI r8, 20
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 445
LDI r11, 212
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
