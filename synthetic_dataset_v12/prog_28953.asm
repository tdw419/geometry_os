; DESCRIPTION: Draws a red rectangle at (120, 123) with width 105 and height 40.
; PLAN: r0=120(x), r1=123(y), r2=105(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 123
LDI r2, 105
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
