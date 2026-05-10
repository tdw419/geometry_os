; DESCRIPTION: Draws a orange rectangle at (379, 130) with width 33 and height 118.
; PLAN: r0=379(x), r1=130(y), r2=33(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 130
LDI r2, 33
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
