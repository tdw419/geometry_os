; DESCRIPTION: Draws a red rectangle at (11, 108) with width 11 and height 85.
; PLAN: r0=11(x), r1=108(y), r2=11(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 108
LDI r2, 11
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
