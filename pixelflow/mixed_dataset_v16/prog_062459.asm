; DESCRIPTION: Draws a white rectangle at (49, 151) with width 82 and height 111.
; PLAN: r0=49(x), r1=151(y), r2=82(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 151
LDI r2, 82
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
