; DESCRIPTION: Draws a white rectangle at (4, 21) with width 41 and height 39.
; PLAN: r0=4(x), r1=21(y), r2=41(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 21
LDI r2, 41
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
