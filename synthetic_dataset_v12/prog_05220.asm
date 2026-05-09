; DESCRIPTION: Composite: Draws a red circle centered at (128, 182) with radius 24 then Creates a black rectangular region at (22, 92) spanning 120 by 70 pixels.
; PLAN: r0=128(x), r1=182(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=22(x), r6=92(y), r7=120(width), r8=70(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 128
LDI r1, 182
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 22
LDI r6, 92
LDI r7, 120
LDI r8, 70
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
