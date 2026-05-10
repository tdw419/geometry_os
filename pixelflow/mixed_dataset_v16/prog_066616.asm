; DESCRIPTION: Draws a red rectangle at (219, 34) with width 24 and height 76.
; PLAN: r0=219(x), r1=34(y), r2=24(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 34
LDI r2, 24
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
