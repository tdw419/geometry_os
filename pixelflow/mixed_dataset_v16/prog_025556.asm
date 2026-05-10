; DESCRIPTION: Draws a red rectangle at (20, 76) with width 85 and height 78.
; PLAN: r0=20(x), r1=76(y), r2=85(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 76
LDI r2, 85
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
