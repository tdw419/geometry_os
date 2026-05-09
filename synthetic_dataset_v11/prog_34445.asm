; DESCRIPTION: Draws a white rectangle at (18, 35) with width 82 and height 58.
; PLAN: r0=18(x), r1=35(y), r2=82(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 35
LDI r2, 82
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
