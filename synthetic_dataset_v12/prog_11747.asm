; DESCRIPTION: Draws a white rectangle at (83, 114) with width 107 and height 82.
; PLAN: r0=83(x), r1=114(y), r2=107(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 114
LDI r2, 107
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
