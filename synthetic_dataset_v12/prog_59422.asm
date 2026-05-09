; DESCRIPTION: Draws a white rectangle at (165, 140) with width 74 and height 21.
; PLAN: r0=165(x), r1=140(y), r2=74(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 140
LDI r2, 74
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
