; DESCRIPTION: Draws a blue rectangle at (10, 103) with width 86 and height 17.
; PLAN: r0=10(x), r1=103(y), r2=86(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 103
LDI r2, 86
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
