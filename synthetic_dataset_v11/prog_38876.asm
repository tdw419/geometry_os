; DESCRIPTION: Draws a blue rectangle at (123, 25) with width 65 and height 86.
; PLAN: r0=123(x), r1=25(y), r2=65(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 25
LDI r2, 65
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
