; DESCRIPTION: Draws a white rectangle at (210, 26) with width 53 and height 101.
; PLAN: r0=210(x), r1=26(y), r2=53(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 26
LDI r2, 53
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
