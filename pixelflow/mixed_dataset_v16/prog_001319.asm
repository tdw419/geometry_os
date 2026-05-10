; DESCRIPTION: Draws a white rectangle at (117, 148) with width 25 and height 34.
; PLAN: r0=117(x), r1=148(y), r2=25(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 148
LDI r2, 25
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
