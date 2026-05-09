; DESCRIPTION: Draws a blue rectangle at (34, 69) with width 107 and height 21.
; PLAN: r0=34(x), r1=69(y), r2=107(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 69
LDI r2, 107
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
