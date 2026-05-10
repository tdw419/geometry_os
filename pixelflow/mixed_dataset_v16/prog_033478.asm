; DESCRIPTION: Draws a blue rectangle at (282, 8) with width 120 and height 21.
; PLAN: r0=282(x), r1=8(y), r2=120(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 8
LDI r2, 120
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
