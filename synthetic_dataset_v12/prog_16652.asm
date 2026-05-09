; DESCRIPTION: Draws a blue rectangle at (20, 120) with width 108 and height 47.
; PLAN: r0=20(x), r1=120(y), r2=108(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 120
LDI r2, 108
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
