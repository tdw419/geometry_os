; DESCRIPTION: Draws a blue rectangle at (264, 194) with width 18 and height 85.
; PLAN: r0=264(x), r1=194(y), r2=18(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 194
LDI r2, 18
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
