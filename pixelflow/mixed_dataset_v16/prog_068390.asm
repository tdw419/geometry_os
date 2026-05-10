; DESCRIPTION: Composite: Draws a orange circle centered at (219, 143) with radius 24 then Places a blue 92x10 rectangle at position (47, 175).
; PLAN: r0=219(x), r1=143(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x), r6=175(y), r7=92(width), r8=10(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 219
LDI r1, 143
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 175
LDI r7, 92
LDI r8, 10
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
