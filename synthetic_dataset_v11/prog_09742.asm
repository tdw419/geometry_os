; DESCRIPTION: Composite: . Then Creates a purple circular shape at (142, 68) with radius 65. Then Draws a green rectangle at (11, 16) with width 53 and height 20.
; PLAN: r0=142(x), r1=68(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=11(x), r1=16(y), r2=53(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (142, 68) with radius 65.
; PLAN: r0=142(x), r1=68(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 68
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green rectangle at (11, 16) with width 53 and height 20.
; PLAN: r0=11(x), r1=16(y), r2=53(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 16
LDI r2, 53
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
