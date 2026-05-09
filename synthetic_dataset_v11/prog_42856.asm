; DESCRIPTION: Composite: . Then Draws a purple rectangle at (128, 23) with width 99 and height 72. Then Creates a orange circular shape at (56, 215) with radius 14.
; PLAN: r0=128(x), r1=23(y), r2=99(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=56(x), r1=215(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a purple rectangle at (128, 23) with width 99 and height 72.
; PLAN: r0=128(x), r1=23(y), r2=99(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 23
LDI r2, 99
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange circular shape at (56, 215) with radius 14.
; PLAN: r0=56(x), r1=215(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 215
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
