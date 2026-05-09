; DESCRIPTION: Draws a white rectangle at (150, 41) with width 75 and height 40.
; PLAN: r0=150(x), r1=41(y), r2=75(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 41
LDI r2, 75
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
