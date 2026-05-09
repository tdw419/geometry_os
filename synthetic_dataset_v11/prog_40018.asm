; DESCRIPTION: Draws a red rectangle at (54, 21) with width 108 and height 74.
; PLAN: r0=54(x), r1=21(y), r2=108(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 21
LDI r2, 108
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
