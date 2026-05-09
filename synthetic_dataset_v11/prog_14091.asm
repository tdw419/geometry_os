; DESCRIPTION: Draws a white rectangle at (175, 220) with width 41 and height 30.
; PLAN: r0=175(x), r1=220(y), r2=41(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 220
LDI r2, 41
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
