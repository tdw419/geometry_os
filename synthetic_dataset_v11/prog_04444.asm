; DESCRIPTION: Composite: . Then Creates a purple circular shape at (132, 146) with radius 60. Then Draws a black rectangle at (193, 104) with width 45 and height 97.
; PLAN: r0=132(x), r1=146(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=193(x), r1=104(y), r2=45(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (132, 146) with radius 60.
; PLAN: r0=132(x), r1=146(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 146
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black rectangle at (193, 104) with width 45 and height 97.
; PLAN: r0=193(x), r1=104(y), r2=45(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 104
LDI r2, 45
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
