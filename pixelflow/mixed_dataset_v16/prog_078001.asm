; DESCRIPTION: Draws a white rectangle at (197, 53) with width 57 and height 116.
; PLAN: r0=197(x), r1=53(y), r2=57(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 53
LDI r2, 57
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
