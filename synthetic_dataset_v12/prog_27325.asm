; DESCRIPTION: Draws a white rectangle at (252, 95) with width 113 and height 102.
; PLAN: r0=252(x), r1=95(y), r2=113(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 95
LDI r2, 113
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
