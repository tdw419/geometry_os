; DESCRIPTION: Draws a white rectangle at (159, 48) with width 69 and height 86.
; PLAN: r0=159(x), r1=48(y), r2=69(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 48
LDI r2, 69
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
