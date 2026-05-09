; DESCRIPTION: Draws a green rectangle at (421, 27) with width 79 and height 29.
; PLAN: r0=421(x), r1=27(y), r2=79(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 27
LDI r2, 79
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
