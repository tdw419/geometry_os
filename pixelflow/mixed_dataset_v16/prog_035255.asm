; DESCRIPTION: Draws a blue rectangle at (10, 1) with width 34 and height 111.
; PLAN: r0=10(x), r1=1(y), r2=34(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 1
LDI r2, 34
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
