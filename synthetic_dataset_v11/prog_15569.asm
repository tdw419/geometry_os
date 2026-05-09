; DESCRIPTION: Draws a white rectangle at (59, 75) with width 63 and height 74.
; PLAN: r0=59(x), r1=75(y), r2=63(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 75
LDI r2, 63
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
