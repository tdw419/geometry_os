; DESCRIPTION: Draws a white rectangle at (25, 11) with width 107 and height 32.
; PLAN: r0=25(x), r1=11(y), r2=107(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 11
LDI r2, 107
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
