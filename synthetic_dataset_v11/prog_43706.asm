; DESCRIPTION: Draws a white rectangle at (174, 140) with width 30 and height 36.
; PLAN: r0=174(x), r1=140(y), r2=30(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 140
LDI r2, 30
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
