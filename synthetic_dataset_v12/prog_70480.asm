; DESCRIPTION: Draws a yellow rectangle at (76, 86) with width 47 and height 107.
; PLAN: r0=76(x), r1=86(y), r2=47(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 86
LDI r2, 47
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
