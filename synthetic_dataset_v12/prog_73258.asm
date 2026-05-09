; DESCRIPTION: Composite: Draws a green circle centered at (75, 173) with radius 16 then Sets a single red pixel at (349, 94) then Places a orange 85x67 rectangle at position (9, 38).
; PLAN: r0=75(x), r1=173(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x), r6=94(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=9(x), r11=38(y), r12=85(width), r13=67(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 75
LDI r1, 173
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 94
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 9
LDI r11, 38
LDI r12, 85
LDI r13, 67
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
