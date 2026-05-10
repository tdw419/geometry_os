; DESCRIPTION: Draws a green rectangle at (397, 78) with width 45 and height 120.
; PLAN: r0=397(x), r1=78(y), r2=45(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 78
LDI r2, 45
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
