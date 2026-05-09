; DESCRIPTION: Draws a white rectangle at (232, 82) with width 107 and height 47.
; PLAN: r0=232(x), r1=82(y), r2=107(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 82
LDI r2, 107
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
