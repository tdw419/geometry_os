; DESCRIPTION: Composite: Places a purple 14x72 rectangle at position (342, 60) then Draws a white circle centered at (337, 132) with radius 68.
; PLAN: r0=342(x), r1=60(y), r2=14(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x), r6=132(y), r7=68(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 342
LDI r1, 60
LDI r2, 14
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 132
LDI r7, 68
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
