; DESCRIPTION: Draws a white rectangle at (376, 162) with width 56 and height 30.
; PLAN: r0=376(x), r1=162(y), r2=56(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 162
LDI r2, 56
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
