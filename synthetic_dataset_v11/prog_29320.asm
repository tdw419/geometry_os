; DESCRIPTION: Draws a white rectangle at (40, 165) with width 19 and height 58.
; PLAN: r0=40(x), r1=165(y), r2=19(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 165
LDI r2, 19
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
