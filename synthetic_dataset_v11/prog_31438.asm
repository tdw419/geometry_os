; DESCRIPTION: Draws a white rectangle at (74, 46) with width 74 and height 104.
; PLAN: r0=74(x), r1=46(y), r2=74(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 46
LDI r2, 74
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
