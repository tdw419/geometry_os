; DESCRIPTION: Draws a green rectangle at (60, 26) with width 43 and height 61.
; PLAN: r0=60(x), r1=26(y), r2=43(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 26
LDI r2, 43
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
