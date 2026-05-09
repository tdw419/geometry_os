; DESCRIPTION: Composite: Sets a single magenta pixel at (456, 86) then Creates a purple circular shape at (217, 157) with radius 76 then Draws a orange rectangle at (196, 25) with width 21 and height 105.
; PLAN: r0=456(x), r1=86(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=157(y), r7=76(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=196(x), r11=25(y), r12=21(width), r13=105(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 456
LDI r1, 86
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 217
LDI r6, 157
LDI r7, 76
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 196
LDI r11, 25
LDI r12, 21
LDI r13, 105
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
