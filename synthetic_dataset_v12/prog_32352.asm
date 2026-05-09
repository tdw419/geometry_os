; DESCRIPTION: Composite: Renders a blue box of size 58x53 starting at (39, 160) then Creates a red circular shape at (364, 135) with radius 14.
; PLAN: r0=39(x), r1=160(y), r2=58(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=364(x), r6=135(y), r7=14(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 39
LDI r1, 160
LDI r2, 58
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 364
LDI r6, 135
LDI r7, 14
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
