; DESCRIPTION: Composite: Places a cyan 72x55 rectangle at position (381, 40) then Draws a magenta circle centered at (116, 91) with radius 39.
; PLAN: r0=381(x), r1=40(y), r2=72(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x), r6=91(y), r7=39(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 381
LDI r1, 40
LDI r2, 72
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 91
LDI r7, 39
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
