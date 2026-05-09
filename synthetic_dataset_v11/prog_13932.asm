; DESCRIPTION: Draws a red rectangle at (85, 83) with width 52 and height 113.
; PLAN: r0=85(x), r1=83(y), r2=52(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 83
LDI r2, 52
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
