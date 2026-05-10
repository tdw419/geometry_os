; DESCRIPTION: Composite: Draws a yellow circle centered at (65, 79) with radius 58 then Places a purple 28x36 rectangle at position (436, 170).
; PLAN: r0=65(x), r1=79(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x), r6=170(y), r7=28(width), r8=36(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 65
LDI r1, 79
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 170
LDI r7, 28
LDI r8, 36
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
