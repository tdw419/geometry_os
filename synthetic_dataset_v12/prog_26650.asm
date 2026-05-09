; DESCRIPTION: Draws a white rectangle at (294, 76) with width 78 and height 83.
; PLAN: r0=294(x), r1=76(y), r2=78(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 76
LDI r2, 78
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
