; DESCRIPTION: Draws a white rectangle at (129, 111) with width 13 and height 30.
; PLAN: r0=129(x), r1=111(y), r2=13(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 111
LDI r2, 13
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
