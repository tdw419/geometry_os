; DESCRIPTION: Draws a red rectangle at (385, 2) with width 76 and height 74.
; PLAN: r0=385(x), r1=2(y), r2=76(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 2
LDI r2, 76
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
