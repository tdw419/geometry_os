; DESCRIPTION: Draws a red rectangle at (376, 3) with width 33 and height 61.
; PLAN: r0=376(x), r1=3(y), r2=33(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 3
LDI r2, 33
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
