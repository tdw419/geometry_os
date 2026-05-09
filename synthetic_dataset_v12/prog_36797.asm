; DESCRIPTION: Draws a green rectangle at (376, 11) with width 87 and height 55.
; PLAN: r0=376(x), r1=11(y), r2=87(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 11
LDI r2, 87
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
