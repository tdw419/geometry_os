; DESCRIPTION: Draws a green rectangle at (19, 78) with width 64 and height 82.
; PLAN: r0=19(x), r1=78(y), r2=64(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 78
LDI r2, 64
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
