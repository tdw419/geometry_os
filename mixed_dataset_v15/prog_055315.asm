; DESCRIPTION: Composite: Places a red 116x72 rectangle at position (88, 25) then Draws a yellow circle centered at (294, 125) with radius 29.
; PLAN: r0=88(x), r1=25(y), r2=116(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x), r6=125(y), r7=29(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 88
LDI r1, 25
LDI r2, 116
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 125
LDI r7, 29
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
