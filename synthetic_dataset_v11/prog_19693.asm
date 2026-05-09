; DESCRIPTION: Draws a white rectangle at (41, 58) with width 57 and height 61.
; PLAN: r0=41(x), r1=58(y), r2=57(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 58
LDI r2, 57
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
