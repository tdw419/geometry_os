; DESCRIPTION: Draws a red rectangle at (364, 100) with width 69 and height 64.
; PLAN: r0=364(x), r1=100(y), r2=69(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 100
LDI r2, 69
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
