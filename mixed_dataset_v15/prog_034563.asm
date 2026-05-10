; DESCRIPTION: Draws a magenta rectangle at (379, 12) with width 61 and height 76.
; PLAN: r0=379(x), r1=12(y), r2=61(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 12
LDI r2, 61
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
