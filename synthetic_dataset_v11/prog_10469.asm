; DESCRIPTION: Draws a blue rectangle at (86, 26) with width 109 and height 96.
; PLAN: r0=86(x), r1=26(y), r2=109(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 26
LDI r2, 109
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
