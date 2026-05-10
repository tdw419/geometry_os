; DESCRIPTION: Draws a blue rectangle at (263, 84) with width 10 and height 27.
; PLAN: r0=263(x), r1=84(y), r2=10(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 84
LDI r2, 10
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
