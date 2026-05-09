; DESCRIPTION: Composite: Places a purple dot at position (394, 60) then Creates a magenta circular shape at (62, 160) with radius 43 then Draws a magenta rectangle at (212, 118) with width 56 and height 100.
; PLAN: r0=394(x), r1=60(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=62(x), r6=160(y), r7=43(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=212(x), r11=118(y), r12=56(width), r13=100(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 394
LDI r1, 60
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 62
LDI r6, 160
LDI r7, 43
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 212
LDI r11, 118
LDI r12, 56
LDI r13, 100
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
