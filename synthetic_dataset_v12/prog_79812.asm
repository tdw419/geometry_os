; DESCRIPTION: Draws a white rectangle at (86, 123) with width 90 and height 117.
; PLAN: r0=86(x), r1=123(y), r2=90(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 123
LDI r2, 90
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
