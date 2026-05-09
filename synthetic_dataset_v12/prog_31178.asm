; DESCRIPTION: Draws a blue rectangle at (128, 44) with width 114 and height 27.
; PLAN: r0=128(x), r1=44(y), r2=114(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 44
LDI r2, 114
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
