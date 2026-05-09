; DESCRIPTION: Composite: Places a yellow dot at position (166, 133) then Draws a orange circle centered at (301, 123) with radius 76 then Places a purple 72x12 rectangle at position (32, 141).
; PLAN: r0=166(x), r1=133(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=301(x), r6=123(y), r7=76(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=32(x), r11=141(y), r12=72(width), r13=12(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 133
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 301
LDI r6, 123
LDI r7, 76
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 32
LDI r11, 141
LDI r12, 72
LDI r13, 12
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
