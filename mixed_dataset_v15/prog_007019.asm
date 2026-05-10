; DESCRIPTION: Draws a blue rectangle at (9, 196) with width 63 and height 28.
; PLAN: r0=9(x), r1=196(y), r2=63(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 196
LDI r2, 63
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
