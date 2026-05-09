; DESCRIPTION: Draws a blue rectangle at (48, 69) with width 65 and height 47.
; PLAN: r0=48(x), r1=69(y), r2=65(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 69
LDI r2, 65
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
