; DESCRIPTION: Composite: Draws a red circle centered at (157, 152) with radius 78 then Places a green 69x65 rectangle at position (426, 46).
; PLAN: r0=157(x), r1=152(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x), r6=46(y), r7=69(width), r8=65(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 157
LDI r1, 152
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 46
LDI r7, 69
LDI r8, 65
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
