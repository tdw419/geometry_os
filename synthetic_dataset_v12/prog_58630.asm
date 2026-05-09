; DESCRIPTION: Draws a white rectangle at (270, 98) with width 85 and height 117.
; PLAN: r0=270(x), r1=98(y), r2=85(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 98
LDI r2, 85
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
