; DESCRIPTION: Draws a red rectangle at (134, 150) with width 47 and height 14.
; PLAN: r0=134(x), r1=150(y), r2=47(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 150
LDI r2, 47
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
