; DESCRIPTION: Draws a white rectangle at (352, 136) with width 112 and height 30.
; PLAN: r0=352(x), r1=136(y), r2=112(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 136
LDI r2, 112
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
