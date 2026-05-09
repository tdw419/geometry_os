; DESCRIPTION: Draws a black rectangle at (299, 70) with width 11 and height 117.
; PLAN: r0=299(x), r1=70(y), r2=11(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 70
LDI r2, 11
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
