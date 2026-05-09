; DESCRIPTION: Draws a white rectangle at (376, 3) with width 82 and height 117.
; PLAN: r0=376(x), r1=3(y), r2=82(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 3
LDI r2, 82
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
