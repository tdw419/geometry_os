; DESCRIPTION: Draws a white rectangle at (175, 41) with width 54 and height 23.
; PLAN: r0=175(x), r1=41(y), r2=54(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 41
LDI r2, 54
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
