; DESCRIPTION: Composite: Draws a red circle centered at (237, 84) with radius 53 then Draws a blue rectangle at (373, 67) with width 28 and height 115.
; PLAN: r0=237(x), r1=84(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x), r6=67(y), r7=28(width), r8=115(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 237
LDI r1, 84
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 67
LDI r7, 28
LDI r8, 115
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
