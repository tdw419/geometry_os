; DESCRIPTION: Draws a blue rectangle at (465, 113) with width 44 and height 78.
; PLAN: r0=465(x), r1=113(y), r2=44(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 113
LDI r2, 44
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
