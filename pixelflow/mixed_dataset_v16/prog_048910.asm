; DESCRIPTION: Composite: Places a yellow 103x69 rectangle at position (391, 125) then Creates a blue circular shape at (309, 139) with radius 77.
; PLAN: r0=391(x), r1=125(y), r2=103(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=309(x), r6=139(y), r7=77(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 391
LDI r1, 125
LDI r2, 103
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 139
LDI r7, 77
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
