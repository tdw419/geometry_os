; DESCRIPTION: Composite: Draws a orange circle centered at (468, 219) with radius 25 then Places a blue 53x109 rectangle at position (65, 10).
; PLAN: r0=468(x), r1=219(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=65(x), r6=10(y), r7=53(width), r8=109(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 468
LDI r1, 219
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 65
LDI r6, 10
LDI r7, 53
LDI r8, 109
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
