; DESCRIPTION: Draws a blue rectangle at (76, 93) with width 88 and height 91.
; PLAN: r0=76(x), r1=93(y), r2=88(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 93
LDI r2, 88
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
