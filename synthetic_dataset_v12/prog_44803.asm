; DESCRIPTION: Draws a white rectangle at (112, 103) with width 60 and height 36.
; PLAN: r0=112(x), r1=103(y), r2=60(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 103
LDI r2, 60
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
