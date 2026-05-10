; DESCRIPTION: Composite: Renders a cyan box of size 58x25 starting at (412, 35) then Creates a white circular shape at (442, 62) with radius 60.
; PLAN: r0=412(x), r1=35(y), r2=58(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=442(x), r6=62(y), r7=60(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 412
LDI r1, 35
LDI r2, 58
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 62
LDI r7, 60
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
