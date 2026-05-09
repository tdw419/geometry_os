; DESCRIPTION: Draws a white rectangle at (350, 43) with width 10 and height 98.
; PLAN: r0=350(x), r1=43(y), r2=10(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 43
LDI r2, 10
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
