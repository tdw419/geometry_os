; DESCRIPTION: Draws a blue rectangle at (161, 28) with width 74 and height 76.
; PLAN: r0=161(x), r1=28(y), r2=74(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 28
LDI r2, 74
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
