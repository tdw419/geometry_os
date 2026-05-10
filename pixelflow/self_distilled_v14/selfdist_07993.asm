; DESCRIPTION: Draws a green rectangle at (53, 143) with width 66 and height 57.
; PLAN: r0=53(x), r1=143(y), r2=66(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 143
LDI r2, 66
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
