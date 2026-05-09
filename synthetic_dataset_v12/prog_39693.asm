; DESCRIPTION: Draws a black rectangle at (224, 114) with width 74 and height 102.
; PLAN: r0=224(x), r1=114(y), r2=74(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 114
LDI r2, 74
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
