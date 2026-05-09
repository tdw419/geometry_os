; DESCRIPTION: Draws a red rectangle at (50, 83) with width 108 and height 50.
; PLAN: r0=50(x), r1=83(y), r2=108(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 83
LDI r2, 108
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
