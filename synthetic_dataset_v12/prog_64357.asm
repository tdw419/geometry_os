; DESCRIPTION: Draws a white rectangle at (283, 163) with width 60 and height 65.
; PLAN: r0=283(x), r1=163(y), r2=60(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 163
LDI r2, 60
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
