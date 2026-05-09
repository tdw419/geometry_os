; DESCRIPTION: Draws a white rectangle at (294, 172) with width 56 and height 83.
; PLAN: r0=294(x), r1=172(y), r2=56(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 172
LDI r2, 56
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
