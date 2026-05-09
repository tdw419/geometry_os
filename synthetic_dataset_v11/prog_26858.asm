; DESCRIPTION: Draws a white rectangle at (100, 5) with width 95 and height 102.
; PLAN: r0=100(x), r1=5(y), r2=95(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 5
LDI r2, 95
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
