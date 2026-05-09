; DESCRIPTION: Draws a white rectangle at (303, 91) with width 13 and height 119.
; PLAN: r0=303(x), r1=91(y), r2=13(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 91
LDI r2, 13
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
