; DESCRIPTION: Draws a white rectangle at (375, 93) with width 39 and height 23.
; PLAN: r0=375(x), r1=93(y), r2=39(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 93
LDI r2, 39
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
