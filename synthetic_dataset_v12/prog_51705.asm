; DESCRIPTION: Draws a blue rectangle at (320, 35) with width 80 and height 60.
; PLAN: r0=320(x), r1=35(y), r2=80(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 35
LDI r2, 80
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
