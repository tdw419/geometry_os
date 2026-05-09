; DESCRIPTION: Draws a white rectangle at (350, 176) with width 70 and height 66.
; PLAN: r0=350(x), r1=176(y), r2=70(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 176
LDI r2, 70
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
