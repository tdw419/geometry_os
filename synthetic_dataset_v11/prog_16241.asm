; DESCRIPTION: Draws a white rectangle at (127, 23) with width 88 and height 32.
; PLAN: r0=127(x), r1=23(y), r2=88(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 23
LDI r2, 88
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
