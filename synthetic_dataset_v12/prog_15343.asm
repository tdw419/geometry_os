; DESCRIPTION: Draws a blue rectangle at (400, 17) with width 24 and height 70.
; PLAN: r0=400(x), r1=17(y), r2=24(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 17
LDI r2, 24
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
