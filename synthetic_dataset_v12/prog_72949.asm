; DESCRIPTION: Draws a blue rectangle at (312, 26) with width 86 and height 50.
; PLAN: r0=312(x), r1=26(y), r2=86(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 26
LDI r2, 86
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
