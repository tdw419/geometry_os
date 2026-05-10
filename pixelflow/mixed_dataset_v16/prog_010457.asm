; DESCRIPTION: Composite: Places a red circle of radius 42 at center (173, 49) then Places a purple dot at position (288, 205) then Draws a magenta rectangle at (404, 176) with width 76 and height 32.
; PLAN: r0=173(x), r1=49(y), r2=42(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=288(x), r6=205(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=404(x), r11=176(y), r12=76(width), r13=32(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 173
LDI r1, 49
LDI r2, 42
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 288
LDI r6, 205
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 404
LDI r11, 176
LDI r12, 76
LDI r13, 32
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
