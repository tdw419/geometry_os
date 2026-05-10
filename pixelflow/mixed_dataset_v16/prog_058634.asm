; DESCRIPTION: Composite: Creates a cyan circular shape at (357, 194) with radius 49 then Places a blue dot at position (456, 117) then Draws a red rectangle at (119, 72) with width 114 and height 47.
; PLAN: r0=357(x), r1=194(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x), r6=117(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=119(x), r11=72(y), r12=114(width), r13=47(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 194
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 117
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 119
LDI r11, 72
LDI r12, 114
LDI r13, 47
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
