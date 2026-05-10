; DESCRIPTION: Composite: Places a black 49x32 rectangle at position (157, 135) then Draws a purple circle centered at (416, 51) with radius 21.
; PLAN: r0=157(x), r1=135(y), r2=49(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=416(x), r6=51(y), r7=21(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 157
LDI r1, 135
LDI r2, 49
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 51
LDI r7, 21
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
