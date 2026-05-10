; DESCRIPTION: Draws a black rectangle at (114, 70) with width 120 and height 62.
; PLAN: r0=114(x), r1=70(y), r2=120(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 70
LDI r2, 120
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
