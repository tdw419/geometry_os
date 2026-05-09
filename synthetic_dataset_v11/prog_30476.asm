; DESCRIPTION: Draws a red rectangle at (108, 30) with width 20 and height 85.
; PLAN: r0=108(x), r1=30(y), r2=20(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 30
LDI r2, 20
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
