; DESCRIPTION: Composite: Creates a magenta circular shape at (194, 143) with radius 80 then Draws a cyan rectangle at (141, 104) with width 67 and height 82.
; PLAN: r0=194(x), r1=143(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x), r6=104(y), r7=67(width), r8=82(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 194
LDI r1, 143
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 104
LDI r7, 67
LDI r8, 82
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
