; DESCRIPTION: Composite: Places a purple 69x73 rectangle at position (269, 2) then Places a yellow circle of radius 32 at center (100, 101).
; PLAN: r0=269(x), r1=2(y), r2=69(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=100(x), r6=101(y), r7=32(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 269
LDI r1, 2
LDI r2, 69
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 101
LDI r7, 32
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
