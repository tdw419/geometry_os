; DESCRIPTION: Draws a blue rectangle at (76, 48) with width 48 and height 25.
; PLAN: r0=76(x), r1=48(y), r2=48(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 48
LDI r2, 48
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
