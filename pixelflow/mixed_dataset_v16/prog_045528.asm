; DESCRIPTION: Draws a white rectangle at (339, 85) with width 65 and height 48.
; PLAN: r0=339(x), r1=85(y), r2=65(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 85
LDI r2, 65
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
