; DESCRIPTION: Draws a red rectangle at (108, 69) with width 37 and height 120.
; PLAN: r0=108(x), r1=69(y), r2=37(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 69
LDI r2, 37
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
