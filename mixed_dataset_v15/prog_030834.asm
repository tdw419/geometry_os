; DESCRIPTION: Composite: Creates a magenta circular shape at (63, 134) with radius 56 then Places a blue dot at position (246, 64) then Draws a magenta rectangle at (181, 39) with width 19 and height 82.
; PLAN: r0=63(x), r1=134(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x), r6=64(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=181(x), r11=39(y), r12=19(width), r13=82(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 63
LDI r1, 134
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 64
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 181
LDI r11, 39
LDI r12, 19
LDI r13, 82
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
