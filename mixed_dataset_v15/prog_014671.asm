; DESCRIPTION: Composite: Places a blue circle of radius 61 at center (134, 68) then Draws a red rectangle at (329, 172) with width 71 and height 58.
; PLAN: r0=134(x), r1=68(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x), r6=172(y), r7=71(width), r8=58(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 68
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 172
LDI r7, 71
LDI r8, 58
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
