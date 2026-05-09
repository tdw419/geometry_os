; DESCRIPTION: Composite: Draws a red circle centered at (209, 166) with radius 68 then Creates a black rectangular region at (53, 176) spanning 60 by 63 pixels.
; PLAN: r0=209(x), r1=166(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x), r6=176(y), r7=60(width), r8=63(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 209
LDI r1, 166
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 176
LDI r7, 60
LDI r8, 63
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
