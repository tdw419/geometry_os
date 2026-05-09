; DESCRIPTION: Draws a black rectangle at (23, 165) with width 107 and height 86.
; PLAN: r0=23(x), r1=165(y), r2=107(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 165
LDI r2, 107
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
