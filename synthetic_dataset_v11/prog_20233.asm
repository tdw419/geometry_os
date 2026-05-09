; DESCRIPTION: Draws a blue rectangle at (11, 25) with width 56 and height 27.
; PLAN: r0=11(x), r1=25(y), r2=56(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 25
LDI r2, 56
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
