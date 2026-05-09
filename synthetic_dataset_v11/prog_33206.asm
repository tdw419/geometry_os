; DESCRIPTION: Draws a white rectangle at (50, 178) with width 34 and height 33.
; PLAN: r0=50(x), r1=178(y), r2=34(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 178
LDI r2, 34
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
