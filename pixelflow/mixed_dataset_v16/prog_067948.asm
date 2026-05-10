; DESCRIPTION: Draws a red rectangle at (375, 27) with width 20 and height 116.
; PLAN: r0=375(x), r1=27(y), r2=20(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 27
LDI r2, 20
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
