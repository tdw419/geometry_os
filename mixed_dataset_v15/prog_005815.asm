; DESCRIPTION: Draws a yellow rectangle at (380, 105) with width 86 and height 60.
; PLAN: r0=380(x), r1=105(y), r2=86(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 105
LDI r2, 86
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
