; DESCRIPTION: Composite: Creates a orange rectangular region at (141, 150) spanning 73 by 80 pixels then Draws a black circle centered at (108, 222) with radius 16.
; PLAN: r0=141(x), r1=150(y), r2=73(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x), r6=222(y), r7=16(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 141
LDI r1, 150
LDI r2, 73
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 222
LDI r7, 16
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
