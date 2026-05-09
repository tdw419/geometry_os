; DESCRIPTION: Draws a white rectangle at (11, 39) with width 34 and height 103.
; PLAN: r0=11(x), r1=39(y), r2=34(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 39
LDI r2, 34
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
