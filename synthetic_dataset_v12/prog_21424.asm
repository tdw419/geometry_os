; DESCRIPTION: Composite: Places a blue dot at position (385, 162) then Creates a white circular shape at (194, 90) with radius 78 then Renders a red box of size 76x111 starting at (255, 101).
; PLAN: r0=385(x), r1=162(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=194(x), r6=90(y), r7=78(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=255(x), r11=101(y), r12=76(width), r13=111(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 162
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 194
LDI r6, 90
LDI r7, 78
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 255
LDI r11, 101
LDI r12, 76
LDI r13, 111
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
