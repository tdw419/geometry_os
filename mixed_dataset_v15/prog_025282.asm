; DESCRIPTION: Draws a white rectangle at (376, 6) with width 113 and height 36.
; PLAN: r0=376(x), r1=6(y), r2=113(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 6
LDI r2, 113
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
