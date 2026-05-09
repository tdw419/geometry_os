; DESCRIPTION: Composite: Creates a yellow rectangular region at (248, 206) spanning 39 by 38 pixels then Draws a cyan circle centered at (230, 158) with radius 72.
; PLAN: r0=248(x), r1=206(y), r2=39(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=230(x), r6=158(y), r7=72(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 248
LDI r1, 206
LDI r2, 39
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 158
LDI r7, 72
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
