; DESCRIPTION: Draws a white rectangle at (217, 39) with width 38 and height 89.
; PLAN: r0=217(x), r1=39(y), r2=38(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 39
LDI r2, 38
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
