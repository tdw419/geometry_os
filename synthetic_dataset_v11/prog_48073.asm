; DESCRIPTION: Draws a yellow rectangle at (47, 148) with width 32 and height 60.
; PLAN: r0=47(x), r1=148(y), r2=32(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 148
LDI r2, 32
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
