; DESCRIPTION: Composite: Draws a white circle centered at (145, 93) with radius 76 then Places a orange dot at position (491, 38) then Places a purple 60x81 rectangle at position (307, 165).
; PLAN: r0=145(x), r1=93(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=491(x), r6=38(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=307(x), r11=165(y), r12=60(width), r13=81(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 93
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 491
LDI r6, 38
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 307
LDI r11, 165
LDI r12, 60
LDI r13, 81
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
