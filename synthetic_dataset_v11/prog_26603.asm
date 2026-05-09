; DESCRIPTION: Draws a green rectangle at (140, 9) with width 60 and height 53.
; PLAN: r0=140(x), r1=9(y), r2=60(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 9
LDI r2, 60
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
