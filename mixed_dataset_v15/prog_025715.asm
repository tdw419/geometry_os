; DESCRIPTION: Draws a white rectangle at (414, 135) with width 74 and height 117.
; PLAN: r0=414(x), r1=135(y), r2=74(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 135
LDI r2, 74
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
